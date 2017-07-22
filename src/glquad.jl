# This file is a part of JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/FEMQuad.jl/blob/master/LICENSE

### Gauss quadrature rules for quadrilaterals

function tensor_product_2d(w::Tuple, p::Tuple)
    N = length(w)
    weights = Float64[]
    points = Tuple{Float64, Float64}[]
    for i in 1:N
        for j in 1:N
            push!(weights, w[i]*w[j])
            push!(points, (p[i], p[j]))
        end
    end
    return zip(weights, points)
end

""" Gauss-Legendre quadrature, 1 point rule on quadrilateral. """
function get_quadrature_points(::Type{Val{:GLQUAD1}})
    w = (2.0, )
    p = (0.0, )
    return tensor_product_2d(w, p)
end

function get_order(::Type{Val{:GLQUAD1}})
    return 1
end

""" Gauss-Legendre quadrature, 4 point rule on quadrilateral. """
function get_quadrature_points(::Type{Val{:GLQUAD4}})
    w = (1.0, 1.0)
    p = (-sqrt(1.0/3.0), sqrt(1.0/3.0))
    return tensor_product_2d(w, p)
end

function get_order(::Type{Val{:GLQUAD4}})
    return 3
end

""" Gauss-Legendre quadrature, 9 point rule on quadrilateral. """
function get_quadrature_points(::Type{Val{:GLQUAD9}})
    w = (5.0/9.0, 8.0/9.0, 5.0/9.0)
    p = (-sqrt(3.0/5.0), 0.0, sqrt(3.0/5.0))
    return tensor_product_2d(w, p)
end

function get_order(::Type{Val{:GLQUAD9}})
    return 5
end

""" Gauss-Legendre quadrature, 16 point rule on quadrilateral. """
function get_quadrature_points(::Type{Val{:GLQUAD16}})
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
    return tensor_product_2d(w, p)
end

function get_order(::Type{Val{:GLQUAD16}})
    return 7
end

""" Gauss-Legendre quadrature, 25 point rule on quadrilateral. """
function get_quadrature_points(::Type{Val{:GLQUAD25}})
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
    return tensor_product_2d(w, p)
end

function get_order(::Type{Val{:GLQUAD25}})
    return 9
end
