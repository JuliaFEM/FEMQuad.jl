# This file is a part of JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/FEMQuad.jl/blob/master/LICENSE

using Test

include("../docs/make.jl")

@testset "FEMQuad.jl" begin
    @testset "test_glseg" begin include("test_glseg.jl") end
    @testset "test_glhex" begin include("test_glhex.jl") end
    @testset "test_gltri" begin include("test_gltri.jl") end
    @testset "test_gltet" begin include("test_gltet.jl") end
    @testset "test_glwed" begin include("test_glwed.jl") end
    @testset "test_glpyr" begin include("test_glpyr.jl") end
end

include("../docs/deploy.jl")
