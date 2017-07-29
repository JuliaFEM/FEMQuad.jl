# FEMQuad.jl

[![Build Status](https://travis-ci.org/JuliaFEM/FEMQuad.jl.svg?branch=master)](https://travis-ci.org/JuliaFEM/FEMQuad.jl)[![Coverage Status](https://coveralls.io/repos/github/JuliaFEM/FEMQuad.jl/badge.svg?branch=master)](https://coveralls.io/github/JuliaFEM/FEMQuad.jl?branch=master)[![](https://img.shields.io/badge/docs-stable-blue.svg)](https://juliafem.github.io/FEMQuad.jl/stable)[![](https://img.shields.io/badge/docs-latest-blue.svg)](https://juliafem.github.io/FEMQuad.jl/latest)[![Issues](https://img.shields.io/github/issues/JuliaFEM/FEMQuad.jl.svg)](https://github.com/JuliaFEM/JuliaFEM.jl/issues)

This package contains various of integration schemes for cartesian and tetrahedron domains. The most common integration rules are tabulated and focus is on speed.

Usage is straightforward. For example, to integrate function f(x) = 1 + x[1] + x[2] + x[1]*x[2] in standard rectangular domain [-1,1]^2, 4 point Gauss-Legendre integration rule is needed:
```julia
using FEMQuad
f(x) = 1 + x[1] + x[2] + x[1]*x[2]
I = 0.0
for (w, gp) in get_quadrature_points(Val{:GLQUAD4})
    I += w*f(gp)
end
```

Result can be verified to be 4. w is integration weight, gp is integration point location and :GLQUAD4 is integration rule used. In the same principle we have integration rules for tetrahedrons, hexahedrons and so on. For example, :GLTET15 is 15-point tetrahedron rule.

## References
- Wikipedia contributors. "Gaussian quadrature." Wikipedia, The Free Encyclopedia. Wikipedia, The Free Encyclopedia, 24 Jul. 2017. Web. 29 Jul. 2017.
