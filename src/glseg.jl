# This file is a part of JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/FEMQuad.jl/blob/master/LICENSE

### Gauss quadrature rules for one dimension

const GLSEG1 = Val{:GLSEG1}
const GLSEG2 = Val{:GLSEG2}
const GLSEG3 = Val{:GLSEG3}
const GLSEG4 = Val{:GLSEG4}
const GLSEG5 = Val{:GLSEG5}

""" Gauss-Legendre quadrature, 1 point rule on segment. """
function get_integration_points(::Type{GLSEG1})
    weights = (2.0, )
    points = (0.0, )
    return zip(weights, points)
end

""" Gauss-Legendre quadrature, 2 point rule on segment. """
function get_integration_points(::Type{GLSEG2})
    weights = (1.0, 1.0)
    points = (-sqrt(1.0/3.0), sqrt(1.0/3.0))
    return zip(weights, points)
end

""" Gauss-Legendre quadrature, 3 point rule on segment. """
function get_integration_points(::Type{GLSEG3})
    weights = (5.0/9.0, 8.0/9.0, 5.0/9.0)
    points = (-sqrt(3.0/5.0), 0.0, sqrt(3.0/5.0))
    return zip(weights, points)
end

""" Gauss-Legendre quadrature, 4 point rule on segment. """
function get_integration_points(::Type{GLSEG4})
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

""" Gauss-Legendre quadrature, 5 point rule on segment. """
function get_integration_points(::Type{GLSEG5})
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

