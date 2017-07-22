# This file is a part of JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/FEMQuad.jl/blob/master/LICENSE

using Base.Test
using FEMQuad
using FEMQuad: integrate_3d, get_rule

@testset "Gauss-Legendre quadratures in hexahedrons" begin
    rules = (:GLHEX1, :GLHEX8, :GLHEX27, :GLHEX81, :GLHEX243)
    f(i) = x -> sum(sum(x)^j for j=0:i)
    r(i::Int) = get_rule(i, rules...)

    @test isapprox(integrate_3d(f(0), r(0)), 8.0)
    @test isapprox(integrate_3d(f(1), r(1)), 8.0)
    @test isapprox(integrate_3d(f(2), r(2)), 16.0)
    @test isapprox(integrate_3d(f(3), r(3)), 16.0)
    @test isapprox(integrate_3d(f(4), r(4)), 184/5)
    @test isapprox(integrate_3d(f(5), r(5)), 184/5)
    @test isapprox(integrate_3d(f(6), r(6)), 12064/105)
    @test isapprox(integrate_3d(f(7), r(7)), 12064/105)
    @test isapprox(integrate_3d(f(8), r(8)), 9928/21)
    @test isapprox(integrate_3d(f(9), r(9)), 9928/21)
end
