module UnitfulCosmo

using Reexport
@reexport using Unitful
@reexport using UnitfulAstro
import PhysicalConstants.CODATA2018: SpeedOfLightInVacuum, ReducedPlanckConstant,
    BoltzmannConstant, NewtonianConstantOfGravitation, VacuumElectricPermittivity

const c  = float(SpeedOfLightInVacuum)
const ħ  = float(ReducedPlanckConstant)
const G = float(NewtonianConstantOfGravitation)
const kB = float(BoltzmannConstant)
const ε0 = float(VacuumElectricPermittivity)

setDimPow(D::Dict, x::Unitful.Dimension{T}) where {T} = D[T] = x.power

function dimDict(x::Unitful.Dimensions{T}) where {T}
    D = Dict(:Length => 0,
             :Mass => 0,
             :Temperature => 0,
             :Time => 0,
             :Current => 0)
    for t in T
        setDimPow(D,t)
    end
    return D
end
dimDict(x::Unitful.Quantity{T}) where {T} = dimDict(dimension(x))
dimDict(x) = Dict(:Length => 0, :Mass => 0, :Temperature => 0, :Time => 0, :Current => 0)

gettypeparams(::Unitful.FreeUnits{T, U, V}) where {T, U, V} = T, U, V
const lengthdimension = gettypeparams(u"Mpc")[2]

"""
    mpc(q; base=u"Mpc")

Convert `q` to Mpc units based on the units specified by `base`. If `base` is
unspecified, `mpc` will default to `Mpc`. You could choose some other length unit
if you wanted.
"""
mpc(q; base=u"Mpc") = _mpc(base, q)

function _mpc(base::Unitful.FreeUnits{T, lengthdimension, U}, q) where {T, U}
    D = dimDict(q)
    (α,β,γ,δ,ϕ) = (D[:Length], D[:Mass], D[:Temperature], D[:Time], D[:Current])
    uconvert(base^(α+δ-β-γ-ϕ),
            q * (c/ħ)^β * (kB/(c*ħ))^γ * c^δ * (c^3*ε0*ħ)^(-ϕ/2))
end

function _mpc(base::Unitful.FreeUnits{T, U, V}, q) where {T, U, V}
    throw("""mpc(q; base)` where `base` has dimensions `$U` has not yet been implemented. Please use a base with dimensions of `length` and then use `unmpc` to convert to your desired units.""")
end

"""
    unmpc(targetUnit, q)

Convert a quantity `q` to units specified by `targetUnits` automatically inserting whatever
factors  of `ħ`, `c`, `ϵ₀` and `kb` are required to make the conversion work.
"""
function unmpc(targetUnit, q)
    natTarget = mpc(1targetUnit)
    natQ = mpc(q)
    ratio = natQ/natTarget
    if typeof(ratio |> dimension) == Unitful.Dimensions{()}
        (ratio)targetUnit
    else
        throw(Unitful.DimensionError)
    end
end


"""
    planck(q)

Strip units by inserting whatever `ħ`, `c`, `G` and `kb` are required to make the conversion work.
"""
function planck(q)
    D = dimDict(q)
    (α,β,γ,δ,ϕ) = (D[:Length], D[:Mass], D[:Temperature], D[:Time], D[:Current])
    return uconvert(Unitful.NoUnits,
        q *
        (G * ħ / c^3)^(-α/2) *  # length
        (c * ħ / G)^(-β/2) *    # mass
        (c^5 * ħ / (G * kB^2))^(-γ/2) *  # temperature
        (G * ħ / c^5)^(ϕ/2 - δ/2) *  # time and current
        (4π * ε0 * ħ * c)^(-ϕ/2))  # charge
end

"""
    unplanck(targetUnit, q)

Convert a quantity `q` to units specified by `targetUnits` automatically inserting whatever
factors  of `ħ`, `c`, `G` and `kb` are required to make the conversion work.
"""
function unplanck(targetUnit, q)
    natTarget = planck(1targetUnit)
    natQ = planck(q)
    ratio = natQ/natTarget
    if typeof(ratio |> dimension) == Unitful.Dimensions{()}
        (ratio)targetUnit
    else
        throw(Unitful.DimensionError)
    end
end


export planck, unplanck
export mpc, unmpc

end
