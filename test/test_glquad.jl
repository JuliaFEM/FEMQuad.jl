# This file is a part of JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/FEMQuad.jl/blob/master/LICENSE

using FEMQuad, Test
using FEMQuad: integrate_2d, get_rule

@testset "Gauss-Legendre quadratures in quadrilaterals" begin
    rules = (:GLQUAD1, :GLQUAD4, :GLQUAD9, :GLQUAD16, :GLQUAD25)
    f(i) = x -> sum(sum(x)^j for j=0:i)
    r(i::Int) = get_rule(i, rules...)

    @test isapprox(integrate_2d(f(0), r(0)), 4.0)
    @test isapprox(integrate_2d(f(1), r(1)), 4.0)
    @test isapprox(integrate_2d(f(2), r(2)), 20/3)
    @test isapprox(integrate_2d(f(3), r(3)), 20/3)
    @test isapprox(integrate_2d(f(4), r(4)), 164/15)
    @test isapprox(integrate_2d(f(5), r(5)), 164/15)
    @test isapprox(integrate_2d(f(6), r(6)), 2108/105)
    @test isapprox(integrate_2d(f(7), r(7)), 2108/105)
    @test isapprox(integrate_2d(f(8), r(8)), 13492/315)
    @test isapprox(integrate_2d(f(9), r(9)), 13492/315)
end
