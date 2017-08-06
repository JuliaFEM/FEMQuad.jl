# This file is a part of JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/FEMQuad.jl/blob/master/LICENSE

using Documenter

deploydocs(
    repo = "github.com/JuliaFEM/FEMQuad.jl.git",
    julia = "0.6",
    target = "build",
    deps = nothing,
    make = nothing)
