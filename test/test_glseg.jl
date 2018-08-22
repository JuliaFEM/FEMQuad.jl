# This file is a part of JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/FEMQuad.jl/blob/master/LICENSE

using FEMQuad, Test
using FEMQuad: integrate_1d, get_rule

@testset "Gauss-Legendre quadratures in one dimension" begin
    # Gaussian quadrature using N points can provide the exact integral if
    # polynomial degree of f is 2N-1 or less => N = (deg(f)+1)/2

    rules = (:GLSEG1, :GLSEG2, :GLSEG3, :GLSEG4, :GLSEG5)
    f(i) = x -> sum([x^j for j=0:i])
    r(i::Int) = get_rule(i, rules...)

    @test isapprox(integrate_1d(f(0), r(0)), 2.0)
    @test isapprox(integrate_1d(f(1), r(1)), 2.0)
    @test isapprox(integrate_1d(f(2), r(2)), 8/3)
    @test isapprox(integrate_1d(f(3), r(3)), 8/3)
    @test isapprox(integrate_1d(f(4), r(4)), 46/15)
    @test isapprox(integrate_1d(f(5), r(5)), 46/15)
    @test isapprox(integrate_1d(f(6), r(6)), 352/105)
    @test isapprox(integrate_1d(f(7), r(7)), 352/105)
    @test isapprox(integrate_1d(f(8), r(8)), 1126/315)
    @test isapprox(integrate_1d(f(9), r(9)), 1126/315)
end
