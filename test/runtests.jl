using UnitfulCosmo
using Test

@testset "planck" begin
    # from Mukhanov. temperature, length, mass, time. no test for current yet
    @test isapprox(planck(2.725u"K"), 1.93e-32, rtol=1e-2)
    @test isapprox(unplanck(1u"K", 1.93e-32), 2.725u"K", rtol=1e-2)
    @test isapprox(planck(310u"cm^-3"), 1.31e-96, rtol=1e-2)
    @test isapprox(unplanck(1u"cm^-3", 1.31e-96), 310u"cm^-3", rtol=1e-2)
    @test isapprox(planck(1u"s"), 1.86e43, rtol=1e-2)
    @test isapprox(unplanck(1u"s", 1.86e43), 1u"s", rtol=1e-2)
    @test isapprox(planck(4.45e5u"g*cm^-3"), 8.63e-89, rtol=1e-2)
    @test isapprox(unplanck(1u"g*cm^-3", 8.63e-89), 4.45e5u"g*cm^-3", rtol=1e-2)
end


@testset "mpc" begin
    # need tests for more than just length/time
    @test mpc(1u"Mpc") ≈ 1u"Mpc"
    @test unmpc(1u"Mpc", 1u"Mpc") ≈ 1u"Mpc"
    @test mpc(1u"yr") ≈ 3.064e-7u"Mpc" rtol=1e-2
    @test unmpc(1u"yr", 3.064e-7u"Mpc") ≈ 1u"yr" rtol=1e-2
end
