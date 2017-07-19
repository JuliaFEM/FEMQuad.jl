# This file is a part of project JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/FEMQuad.jl/blob/master/LICENSE

using Documenter
using FEMQuad

makedocs(
    modules = [FEMQuad],
    checkdocs = :all,
    strict = false)
