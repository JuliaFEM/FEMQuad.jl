# This file is a part of JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/FEMQuad.jl/blob/master/LICENSE

module FEMQuad

# Gaussian-Legendre quadratures in 1d segments
include("glseg.jl")
# Gaussian-Legendre quadratures in 2d quadrangles
include("glquad.jl")
# Gaussian-Legendre quadratures in 2d triangles
include("gltri.jl")
# Gaussian-Legendre quadratures in 3d hexahedrons
include("glhex.jl")
# Gaussian-Legendre quadratures in 3d tetrahedrons
include("gltet.jl")
# Gaussian-Legendre quadratures in 3d wedges
include("glwed.jl")

#include("integrate.jl")

function get_rule(order::Int, rules::Vararg{Symbol})
    for rule in rules
        if get_order(Val{rule}) >= order
            return rule
        end
    end
    warn("No accurate rule enough found, picking last.")
    return rules[end]
end

function integrate_1d(f::Function, rule::Symbol)
    points = get_quadrature_points(Val{rule})
    result = sum(w*f(ip) for (w, ip) in points)
    return result
end

function integrate_2d(f::Function, rule::Symbol)
    points = get_quadrature_points(Val{rule})
    result = sum(w*f(ip) for (w, ip) in points)
    return result
end

function integrate_3d(f::Function, rule::Symbol)
    points = get_quadrature_points(Val{rule})
    result = sum(w*f(ip) for (w, ip) in points)
    return result
end

end
