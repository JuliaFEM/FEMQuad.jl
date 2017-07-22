# This file is a part of JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/FEMQuad.jl/blob/master/LICENSE

### Gauss quadrature rules for one dimension

""" Gauss-Legendre quadrature, 1 point rule on segment. """
function get_quadrature_points(::Type{Val{:GLSEG1}})
    weights = (2.0, )
    points = (0.0, )
    return zip(weights, points)
end

function get_order(::Type{Val{:GLSEG1}})
    return 1
end

""" Gauss-Legendre quadrature, 2 point rule on segment. """
function get_quadrature_points(::Type{Val{:GLSEG2}})
    weights = (1.0, 1.0)
    points = (-sqrt(1.0/3.0), sqrt(1.0/3.0))
    return zip(weights, points)
end

function get_order(::Type{Val{:GLSEG2}})
    return 3
end

""" Gauss-Legendre quadrature, 3 point rule on segment. """
function get_quadrature_points(::Type{Val{:GLSEG3}})
    weights = (5.0/9.0, 8.0/9.0, 5.0/9.0)
    points = (-sqrt(3.0/5.0), 0.0, sqrt(3.0/5.0))
    return zip(weights, points)
end

function get_order(::Type{Val{:GLSEG3}})
    return 5
end

""" Gauss-Legendre quadrature, 4 point rule on segment. """
function get_quadrature_points(::Type{Val{:GLSEG4}})
    weights = (
               1.0/36.0*(18.0-sqrt(30.0)),
               1.0/36.0*(18.0+sqrt(30.0)),
               1.0/36.0*(18.0+sqrt(30.0)),
               1.0/36.0*(18.0-sqrt(30.0)))
    points = (
        -sqrt(3.0/7.0 + 2.0/7.0*sqrt(6.0/5.0)),
        -sqrt(3.0/7.0 - 2.0/7.0*sqrt(6.0/5.0)),
         sqrt(3.0/7.0 - 2.0/7.0*sqrt(6.0/5.0)),
         sqrt(3.0/7.0 + 2.0/7.0*sqrt(6.0/5.0)))
    return zip(weights, points)
end

function get_order(::Type{Val{:GLSEG4}})
    return 7
end

""" Gauss-Legendre quadrature, 5 point rule on segment. """
function get_quadrature_points(::Type{Val{:GLSEG5}})
    weights = (
        1.0/900.0*(322.0-13.0*sqrt(70.0)),
        1.0/900.0*(322.0+13.0*sqrt(70.0)),
        128.0/225.0,
        1.0/900.0*(322.0+13.0*sqrt(70.0)),
        1.0/900.0*(322.0-13.0*sqrt(70.0)))
    points = (
        -1.0/3.0*sqrt(5.0 + 2.0*sqrt(10.0/7.0)),
        -1.0/3.0*sqrt(5.0 - 2.0*sqrt(10.0/7.0)),
         0.0,
         1.0/3.0*sqrt(5.0 - 2.0*sqrt(10.0/7.0)),
         1.0/3.0*sqrt(5.0 + 2.0*sqrt(10.0/7.0)))
    return zip(weights, points)
end

function get_order(::Type{Val{:GLSEG5}})
    return 9
end
