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

These rules are get from 1d quadratures by using tensor production.

```@docs
FEMQuad.get_quadrature_points(::Type{Val{:GLQUAD1}})
FEMQuad.get_quadrature_points(::Type{Val{:GLQUAD4}})
FEMQuad.get_quadrature_points(::Type{Val{:GLQUAD9}})
FEMQuad.get_quadrature_points(::Type{Val{:GLQUAD16}})
FEMQuad.get_quadrature_points(::Type{Val{:GLQUAD25}})
```

### Gauss-Legendre rules in hexahedrons

These rules are get from 1d quadratures by using tensor production.

```@docs
FEMQuad.get_quadrature_points(::Type{Val{:GLHEX1}})
FEMQuad.get_quadrature_points(::Type{Val{:GLHEX8}})
FEMQuad.get_quadrature_points(::Type{Val{:GLHEX27}})
FEMQuad.get_quadrature_points(::Type{Val{:GLHEX81}})
FEMQuad.get_quadrature_points(::Type{Val{:GLHEX243}})
```

### Gauss-Legendre rules in triangles

Get from literature sources.

```@docs
FEMQuad.get_quadrature_points(::Type{Val{:GLTRI1}})
FEMQuad.get_quadrature_points(::Type{Val{:GLTRI3}})
FEMQuad.get_quadrature_points(::Type{Val{:GLTRI3B}})
FEMQuad.get_quadrature_points(::Type{Val{:GLTRI4}})
FEMQuad.get_quadrature_points(::Type{Val{:GLTRI4B}})
FEMQuad.get_quadrature_points(::Type{Val{:GLTRI6}})
FEMQuad.get_quadrature_points(::Type{Val{:GLTRI7}})
FEMQuad.get_quadrature_points(::Type{Val{:GLTRI12}})
```

## Index

```@index
```
