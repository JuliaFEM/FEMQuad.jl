# FEMQuad.jl

[![ci][ci-img]][ci-url]
[![docs-stable][docs-stable-img]][docs-stable-url]
[![docs-latest][docs-latest-img]][docs-latest-url]

FEMQuad.jl contains various of integration schemes for cartesian and tetrahedron
domains. The most common integration rules are tabulated and focus is on speed.

Usage is straightforward. For example, to integrate function
`f(x) = 1 + x[1] + x[2] + x[1]*x[2]` in a standard rectangular domain `[-1,1]^2`,
4 point Gauss-Legendre integration rule is needed:

```julia
using FEMQuad
f(x) = 1 + x[1] + x[2] + x[1]*x[2]
I = 0.0
for (w, gp) in get_quadrature_points(Val{:GLQUAD4})
    I += w*f(gp)
end
```

Result can be verified to be 4. `w` is integration weight, `gp` is integration
point location and `GLQUAD4` is the integration rule used. In the same principle
we have integration rules for tetrahedrons, hexahedrons and so on. For example,
`GLTET15` is a 15-point tetrahedron rule.

## References

- Wikipedia contributors. "Gaussian quadrature." Wikipedia, The Free Encyclopedia. Wikipedia, The Free Encyclopedia, 24 Jul. 2017. Web. 29 Jul. 2017.

[ci-img]: https://github.com/JuliaFEM/FEMQuad.jl/workflows/CI/badge.svg
[ci-url]: https://github.com/JuliaFEM/FEMQuad.jl/actions?query=workflow%3ACI+branch%3Amaster
[docs-stable-img]: https://img.shields.io/badge/docs-stable-blue.svg
[docs-stable-url]: https://juliafem.github.io/FEMQuad.jl/stable
[docs-latest-img]: https://img.shields.io/badge/docs-latest-blue.svg
[docs-latest-url]: https://juliafem.github.io/FEMQuad.jl/latest
