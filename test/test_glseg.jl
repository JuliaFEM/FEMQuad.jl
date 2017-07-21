# This file is a part of JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/FEMQuad.jl/blob/master/LICENSE

using Base.Test
using FEMQuad

function integrate_1d(f::Function, rule::Symbol)
    points = FEMQuad.get_integration_points(getfield(FEMQuad, rule))
    result = sum(w*f(ip) for (w, ip) in points)
    return result
end

@testset "Gauss-Legendre quadratures in one dimension" begin
    # Gaussian quadrature using N points can provide the exact integral if
    # polynomial degree of f is 2N-1 or less => N = (deg(f)+1)/2

    f1(x) = x   # N = 1
    @test isapprox(integrate_1d(f1, :GLSEG1), 0.0)
    f2(x) = x^2 # N = 1.5
    @test isapprox(integrate_1d(f2, :GLSEG2), 2/3)
    f3(x) = x^3 # N = 2
    @test isapprox(integrate_1d(f3, :GLSEG2), 0.0)
    f4(x) = x^4 # N = 2.5
    @test isapprox(integrate_1d(f4, :GLSEG3), 2/5)
    f5(x) = x^5 # N = 3
    @test isapprox(integrate_1d(f5, :GLSEG3), 0.0)
    f6(x) = x^6 # N = 3.5
    @test isapprox(integrate_1d(f6, :GLSEG4), 2/7)
    f7(x) = x^7 # N = 4
    @test isapprox(integrate_1d(f7, :GLSEG4), 0.0)
    f8(x) = x^8 # N = 4.5
    @test isapprox(integrate_1d(f8, :GLSEG5), 2/9)
    f9(x) = x^9 # N = 5
    @test isapprox(integrate_1d(f9, :GLSEG5), 0.0)
end
