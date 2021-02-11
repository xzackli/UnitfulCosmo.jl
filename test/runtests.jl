using UnitfulCosmo
using Test

@testset "planck" begin
    # from Mukhanov. temperature, length, mass, time. no test for current yet
    @test isapprox(planck(2.725u"K"), 1.93e-32, rtol=1e-2)
    @test isapprox(unplanck(u"K", 1.93e-32), 2.725u"K", rtol=1e-2)
    @test isapprox(planck(310u"cm^-3"), 1.31e-96, rtol=1e-2)
    @test isapprox(unplanck(u"cm^-3", 1.31e-96), 310u"cm^-3", rtol=1e-2)
    @test isapprox(planck(1u"s"), 1.86e43, rtol=1e-2)
    @test isapprox(unplanck(u"s", 1.86e43), 1u"s", rtol=1e-2)
    @test isapprox(planck(4.45e5u"g*cm^-3"), 8.63e-89, rtol=1e-2)
    @test isapprox(unplanck(u"g*cm^-3", 8.63e-89), 4.45e5u"g*cm^-3", rtol=1e-2)
    @test_throws Unitful.DimensionError unplanck(u"Mpc", 1u"Mpc^-1")
end

@testset "mpc" begin
    @test mpc(1u"Mpc") ≈ 1u"Mpc"
    @test unmpc(u"Mpc", 1u"Mpc") ≈ 1u"Mpc"
    @test mpc(1u"yr") ≈ 3.064e-7u"Mpc" rtol=1e-2
    @test unmpc(u"yr", 3.064e-7u"Mpc") ≈ 1u"yr" rtol=1e-2
    @test mpc(10u"kg") ≈ 8.772e65u"Mpc^-1" rtol=1e-2
    @test unmpc(u"kg", 8.772e65u"Mpc^-1") ≈ 10u"kg" rtol=1e-2
    @test mpc(273u"K") ≈ 3.679e27u"Mpc^-1" rtol=1e-2
    @test unmpc(u"K", 3.679e27u"Mpc^-1") ≈ 273u"K" rtol=1e-2
    @test mpc(10u"A") ≈ 1.945391641e33u"Mpc^-1" rtol=1e-2
    @test unmpc(u"A", 1.945391641e33u"Mpc^-1") ≈ 10u"A" rtol=1e-2
    @test mpc(10u"kg"; base=u"kpc") ≈ 8.772e62u"kpc^-1" rtol=1e-2
    @test_throws Unitful.DimensionError unmpc(u"Mpc", 1u"Mpc^-1")
end
