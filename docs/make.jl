# This file is a part of JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/FEMQuad.jl/blob/master/LICENSE

using Documenter, FEMQuad

makedocs(modules=[FEMQuad],
         format = :html,
         sitename = "FEMQuad.jl",
         pages = ["index.md", "api.md"])
