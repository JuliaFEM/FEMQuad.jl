# This file is a part of JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/FEMQuad.jl/blob/master/LICENSE

using Base.Test

test_files = String[]

push!(test_files, "test_glseg.jl")
push!(test_files, "test_glquad.jl")
push!(test_files, "test_glhex.jl")
push!(test_files, "test_gltri.jl")

using TimerOutputs
const to = TimerOutput()
@testset "FEMQuad.jl" begin
    for fn in test_files
        timeit(to, fn) do
            include(fn)
        end
    end
end
println()
println("Test statistics:")
println(to)
