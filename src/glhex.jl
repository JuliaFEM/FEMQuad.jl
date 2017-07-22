# This file is a part of JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/FEMQuad.jl/blob/master/LICENSE

### Gauss quadrature rules for hexahedrons using tensor products

function tensor_product_3d(w::Tuple, p::Tuple)
    N = length(w)
    weights = Float64[]
    points = Tuple{Float64, Float64, Float64}[]
    for i in 1:N
        for j in 1:N
            for k in 1:N
                push!(weights, w[i]*w[j]*w[k])
                push!(points, (p[i], p[j], p[k]))
            end
        end
    end
    return zip(weights, points)
end

""" Gauss-Legendre quadrature, 1 point rule on hexahedron. """
function get_quadrature_points(::Type{Val{:GLHEX1}})
    w = (2.0, )
    p = (0.0, )
    return tensor_product_3d(w, p)
end

function get_order(::Type{Val{:GLHEX1}})
    return 1
end

""" Gauss-Legendre quadrature, 8 point rule on hexahedron. """
function get_quadrature_points(::Type{Val{:GLHEX8}})
    w = (1.0, 1.0)
    p = (-sqrt(1.0/3.0), sqrt(1.0/3.0))
    return tensor_product_3d(w, p)
end

function get_order(::Type{Val{:GLHEX8}})
    return 3
end

""" Gauss-Legendre quadrature, 27 point rule on hexahedron. """
function get_quadrature_points(::Type{Val{:GLHEX27}})
    w = (5.0/9.0, 8.0/9.0, 5.0/9.0)
    p = (-sqrt(3.0/5.0), 0.0, sqrt(3.0/5.0))
    return tensor_product_3d(w, p)
end

function get_order(::Type{Val{:GLHEX27}})
    return 5
end

""" Gauss-Legendre quadrature, 81 point rule on hexahedron. """
function get_quadrature_points(::Type{Val{:GLHEX81}})
    w = (
         1.0/36.0*(18.0-sqrt(30.0)),
         1.0/36.0*(18.0+sqrt(30.0)),
         1.0/36.0*(18.0+sqrt(30.0)),
         1.0/36.0*(18.0-sqrt(30.0)))
    p = (
        -sqrt(3.0/7.0 + 2.0/7.0*sqrt(6.0/5.0)),
        -sqrt(3.0/7.0 - 2.0/7.0*sqrt(6.0/5.0)),
         sqrt(3.0/7.0 - 2.0/7.0*sqrt(6.0/5.0)),
         sqrt(3.0/7.0 + 2.0/7.0*sqrt(6.0/5.0)))
    return tensor_product_3d(w, p)
end

function get_order(::Type{Val{:GLHEX81}})
    return 7
end

""" Gauss-Legendre quadrature, 243 point rule on quadrilateral. """
function get_quadrature_points(::Type{Val{:GLHEX243}})
    w = (
        1.0/900.0*(322.0-13.0*sqrt(70.0)),
        1.0/900.0*(322.0+13.0*sqrt(70.0)),
        128.0/225.0,
        1.0/900.0*(322.0+13.0*sqrt(70.0)),
        1.0/900.0*(322.0-13.0*sqrt(70.0)))
    p = (
        -1.0/3.0*sqrt(5.0 + 2.0*sqrt(10.0/7.0)),
        -1.0/3.0*sqrt(5.0 - 2.0*sqrt(10.0/7.0)),
         0.0,
         1.0/3.0*sqrt(5.0 - 2.0*sqrt(10.0/7.0)),
         1.0/3.0*sqrt(5.0 + 2.0*sqrt(10.0/7.0)))
    return tensor_product_3d(w, p)
end

function get_order(::Type{Val{:GLHEX243}})
    return 9
end
