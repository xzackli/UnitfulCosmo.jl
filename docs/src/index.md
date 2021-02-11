```@meta
CurrentModule = UnitfulCosmo
```

# UnitfulCosmo

This package implements two specialized unit systems commonly found in cosmology. It is based on Mason Protter's [NaturallyUnitful.jl](https://github.com/MasonProtter/NaturallyUnitful.jl), another natural unit system that uses eV as the base unit. It re-exports both `Unitful` and `UnitfulAstro`, so you only need to `using UnitfulCosmo`.

### Planck Units

```math
\hbar = c = G = kb = 1
```
These units eliminate all dimensionality. When you convert quantities with units into this system, you make everything dimensionless by applying factors of the fundamental constants. This does mean you lose unit information, but it's also very convenient since your equations don't have any fundamental constants in them anymore. 

This unit system has some large exponents; for example, ``H_0 \sim 10^{-61}``.

```julia-repl
julia> using UnitfulCosmo

julia> planck(2.725u"K")
1.9233698913253178e-32

julia> unplanck(1u"K", 1.9233698913253178e-32)
2.725 K
```

### Mpc Units
```math
\hbar = c = \epsilon_0 = k_B = 1
```
Note that ``G \neq 1``. This leaves one free dimension, and this unit system makes Megaparsec (Mpc) the base unit. In this unit system, both length and time are measured in Mpc, whereas mass, temperature, and current are measured in inverse Mpc. These units are often used for studies of the large scale structure of the Universe. Most cosmological theory codes use these units, in particular because ``H_0`` and wavenumbers ``k`` are nice in this system, and a lot of the constants are 1. 

The downside to this system is that you want to avoid using the gravitational constant ``G``. The price of using natural units and also having a nice ``H_0`` is that ``G \sim 2 \times 10^{-115} \text{Mpc}^2``, which is very cumbersome. Fortunately, in the Boltzmann equations G only appears in the form ``G\rho/c^2``, which has dimensions of ``H_0^2/c^2`` (thanks Antony Lewis).

```julia-repl
julia> mpc(70u"km/s/Mpc")
0.00023349486663870643 Mpc^-1

julia> unmpc(1u"km/s/Mpc", 0.00023349486663870643u"Mpc^-1")
70.0 km Mpc^-1 s^-1
```
