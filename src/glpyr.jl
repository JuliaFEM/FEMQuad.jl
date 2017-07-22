# This file is a part of JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/FEMQuad.jl/blob/master/LICENSE

### Gauss quadrature rules for prismatic elements (wedge)

""" Gauss-Legendre quadrature, 5 point rule on pyramid. """
function get_quadrature_points(::Type{Val{:GLPYR1}})
    g1 =  0.5842373946721771876874344
    g2 = -2.0/3.0
    g3 =  2.0/5.0
    w1 =  81.0/100.0
    w2 =  125.0/27.0
    weights = (w1, w1, w1, w1, w2)
    points = (
              (-g1, -g1, g2),
              ( g1, -g1, g2),
              ( g1,  g1, g2),
              (-g1,  g1, g2),
              (0.0, 0.0, g3))
    return zip(weights, points)
end

function get_order(::Type{Val{:GLPYR1}})
    return 1
end
