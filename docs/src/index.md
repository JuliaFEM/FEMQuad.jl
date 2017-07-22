# FEMQuad.jl documentation

```@contents
```

```@meta
DocTestSetup = quote
    using FEMQuad
end
```

## Functions

### Gauss-Legendre rules in segments

```@docs
FEMQuad.get_quadrature_points(::Type{Val{:GLSEG1}})
FEMQuad.get_quadrature_points(::Type{Val{:GLSEG2}})
FEMQuad.get_quadrature_points(::Type{Val{:GLSEG3}})
FEMQuad.get_quadrature_points(::Type{Val{:GLSEG4}})
FEMQuad.get_quadrature_points(::Type{Val{:GLSEG5}})
```

### Gauss-Legendre rules in quadrangles

These rules are get from 1d quadratures by using tensor production

```@docs
FEMQuad.get_quadrature_points(::Type{Val{:GLQUAD1}})
FEMQuad.get_quadrature_points(::Type{Val{:GLQUAD4}})
FEMQuad.get_quadrature_points(::Type{Val{:GLQUAD9}})
FEMQuad.get_quadrature_points(::Type{Val{:GLQUAD16}})
FEMQuad.get_quadrature_points(::Type{Val{:GLQUAD25}})
```

### Gauss-Legendre rules in hexahedrons

These rules are get from 1d quadratures by using tensor production

```@docs
FEMQuad.get_quadrature_points(::Type{Val{:GLHEX1}})
FEMQuad.get_quadrature_points(::Type{Val{:GLHEX8}})
FEMQuad.get_quadrature_points(::Type{Val{:GLHEX27}})
FEMQuad.get_quadrature_points(::Type{Val{:GLHEX81}})
FEMQuad.get_quadrature_points(::Type{Val{:GLHEX243}})
```

## Index

```@index
```
