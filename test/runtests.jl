using UnitfulCosmo
using Test

@testset "planck" begin
    # from Mukhanov
    @test isapprox(planck(2.725u"K"), 1.93e-32, rtol=1e-2)
    @test isapprox(unplanck(1u"K", 1.93e-32), 2.725u"K", rtol=1e-2)
    @test isapprox(planck(310u"cm^-3"), 1.31e-96, rtol=1e-2)
    @test isapprox(unplanck(1u"cm^-3", 1.31e-96), 310u"cm^-3", rtol=1e-2)
    @test isapprox(planck(1u"s"), 1.86e43, rtol=1e-2)
    @test isapprox(unplanck(1u"s", 1.86e43), 1u"s", rtol=1e-2)
    @test isapprox(planck(4.45e5u"g*cm^-3"), 8.63e-89, rtol=1e-2)
    @test isapprox(unplanck(1u"g*cm^-3", 8.63e-89), 4.45e5u"g*cm^-3", rtol=1e-2)
end
