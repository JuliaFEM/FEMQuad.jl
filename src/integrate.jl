# This file is a part of JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/FEMQuad.jl/blob/master/LICENSE

### triangular and tetrahedral elements

# http://math2.uncc.edu/~shaodeng/TEACHING/math5172/Lectures/Lect_15.PDF
# http://libmesh.github.io/doxygen/quadrature__gauss__2D_8C_source.html

typealias TriangularElement Union{Tri3, Tri6, Tri7}

### 3d elements

typealias TetrahedralElement Union{Tet4, Tet10}

# http://www.colorado.edu/engineering/CAS/courses.d/AFEM.d/AFEM.Ch12.d/AFEM.Ch12.pdf

typealias PyramidalElement Union{Pyr5,}

function get_integration_points(element::PyramidalElement, ::Type{Val{2}})
    g1 =  0.5842373946721771876874344
    g2 = -2.0/3.0
    g3 =  2.0/5.0
    w1 =  81.0/100.0
    w2 =  125.0/27.0
    weights = [w1, w1, w1, w1, w2]
    points = Vector{Float64}[
        [-g1, -g1, g2],
        [ g1, -g1, g2],
        [ g1,  g1, g2],
        [-g1,  g1, g2],
        [0.0, 0.0, g3],
        ]
    return zip(weights, points)
end

typealias PrismaticElement Union{Wedge6, Wedge15}

function get_integration_points(element::PrismaticElement, ::Type{Val{2}})
    weights = 1/6*[1.0, 1.0, 1.0, 1.0, 1.0, 1.0]
    points = Vector{Float64}[
        [0.5, 0.0, -1.0/sqrt(3)],
        [0.0, 0.5, -1.0/sqrt(3)],
        [0.5, 0.5, -1.0/sqrt(3)],
        [0.5, 0.0,  1.0/sqrt(3)],
        [0.0, 0.5,  1.0/sqrt(3)],
        [0.5, 0.5,  1.0/sqrt(3)]]
    return zip(weights, points)
end

# tensor product of triangular element + segment element
#=
function get_integration_points(element::PrismaticElement, ::Type{Val{2}})
    weights = 1.0/6.0*[1.0, 1.0, 1.0, 1.0, 1.0, 1.0]
    points = Vector{Float64}[
        [2.0/3.0, 1.0/6.0, -1.0/sqrt(3.0)],
        [1.0/6.0, 2.0/3.0, -1.0/sqrt(3.0)],
        [1.0/6.0, 1.0/6.0, -1.0/sqrt(3.0)],
        [2.0/3.0, 1.0/6.0, +1.0/sqrt(3.0)],
        [1.0/6.0, 2.0/3.0, +1.0/sqrt(3.0)],
        [1.0/6.0, 1.0/6.0, +1.0/sqrt(3.0)],
        ]
    return zip(weights, points)
end
=#

# tensor product of triangular element + segment element
#=
function get_integration_points(element::PrismaticElement, ::Type{Val{3}})
    weights = [
        5.0/9.0*1.5902069087198858469718450103758e-01,
        5.0/9.0*9.0979309128011415302815498962418e-02,
        5.0/9.0*1.5902069087198858469718450103758e-01,
        5.0/9.0*9.0979309128011415302815498962418e-02,
        8.0/9.0*1.5902069087198858469718450103758e-01,
        8.0/9.0*9.0979309128011415302815498962418e-02,
        8.0/9.0*1.5902069087198858469718450103758e-01,
        8.0/9.0*9.0979309128011415302815498962418e-02,
        5.0/9.0*1.5902069087198858469718450103758e-01,
        5.0/9.0*9.0979309128011415302815498962418e-02,
        5.0/9.0*1.5902069087198858469718450103758e-01,
        5.0/9.0*9.0979309128011415302815498962418e-02]
    points = Vector{Float64}[
        [1.5505102572168219018027159252941e-01, 1.7855872826361642311703513337422e-01, -sqrt(3.0/5.0)],
        [6.4494897427831780981972840747059e-01, 7.5031110222608118177475598324603e-02, -sqrt(3.0/5.0)],
        [1.5505102572168219018027159252941e-01, 6.6639024601470138670269327409637e-01, -sqrt(3.0/5.0)],
        [6.4494897427831780981972840747059e-01, 2.8001991549907407200279599420481e-01, -sqrt(3.0/5.0)],
        [1.5505102572168219018027159252941e-01, 1.7855872826361642311703513337422e-01, 0.0],
        [6.4494897427831780981972840747059e-01, 7.5031110222608118177475598324603e-02, 0.0],
        [1.5505102572168219018027159252941e-01, 6.6639024601470138670269327409637e-01, 0.0],
        [6.4494897427831780981972840747059e-01, 2.8001991549907407200279599420481e-01, 0.0],
        [1.5505102572168219018027159252941e-01, 1.7855872826361642311703513337422e-01, sqrt(3.0/5.0)],
        [6.4494897427831780981972840747059e-01, 7.5031110222608118177475598324603e-02, sqrt(3.0/5.0)],
        [1.5505102572168219018027159252941e-01, 6.6639024601470138670269327409637e-01, sqrt(3.0/5.0)],
        [6.4494897427831780981972840747059e-01, 2.8001991549907407200279599420481e-01, sqrt(3.0/5.0)],
        ]
    return zip(weights, points)
end
=#

#=
function get_integration_points(element::PrismaticElement, ::Type{Val{2}})
    weights = 1.0/96.0*[-27.0, 25.0, 25.0, 25.0, -27.0, 25.0, 25.0, 25.0]
    a = 1.0/sqrt(3.0)
    points = Vector{Float64}[
        [1/3, 1/3, -a],
        [0.6, 0.2, -a],
        [0.2, 0.6, -a],
        [0.2, 0.2, -a],
        [1/3, 1/3,  a],
        [0.6, 0.2,  a],
        [0.2, 0.6,  a],
        [0.2, 0.2,  a]]
    return zip(weights, points)
end
=#

function get_integration_points(element::PrismaticElement, ::Type{Val{3}})
    alpha = sqrt(3/5)
    c1 = 5/9
    c2 = 8/9
    a = (6+sqrt(15))/21
    b = (6-sqrt(15))/21
    weights = [
        c1*9/80,
        c1*((155+sqrt(15))/2400),
        c1*((155+sqrt(15))/2400),
        c1*((155+sqrt(15))/2400),
        c1*((155-sqrt(15))/2400),
        c1*((155-sqrt(15))/2400),
        c1*((155-sqrt(15))/2400),
        c2*9/80,
        c2*((155+sqrt(15))/2400),
        c2*((155+sqrt(15))/2400),
        c2*((155+sqrt(15))/2400),
        c2*((155-sqrt(15))/2400),
        c2*((155-sqrt(15))/2400),
        c2*((155-sqrt(15))/2400),
        c1*9/80,
        c1*((155+sqrt(15))/2400),
        c1*((155+sqrt(15))/2400),
        c1*((155+sqrt(15))/2400),
        c1*((155-sqrt(15))/2400),
        c1*((155-sqrt(15))/2400),
        c1*((155-sqrt(15))/2400),
    ]
    points = Vector{Float64}[
        [1/3, 1/3, -alpha],
        [a, a, -alpha],
        [1-2a, a, -alpha],
        [a, 1-2a, -alpha],
        [b, b, -alpha],
        [1-2b, b, -alpha],
        [b, 1-2b, -alpha],
        [1/3, 1/3, 0],
        [a, a, 0],
        [1-2a, a, 0],
        [a, 1-2a, 0],
        [b, b, 0],
        [1-2b, b, 0],
        [b, 1-2b, 0],
        [1/3, 1/3, alpha],
        [a, a, alpha],
        [1-2a, a, alpha],
        [a, 1-2a, alpha],
        [b, b, alpha],
        [1-2b, b, alpha],
        [b, 1-2b, alpha],
        ]
    return zip(weights, points)
end

function get_integration_points(element::Union{TriangularElement,
            TetrahedralElement, PyramidalElement, PrismaticElement}, order::Int64)
    return get_integration_points(element, Val{order})
end

### default number of integration points for each element
### 2 for linear elements, 3 for quadratic

typealias LinearElement Union{Seg2, Tri3, Quad4, Tet4, Pyr5, Wedge6, Hex8}

typealias QuadraticElement Union{Seg3, Tri6, Tri7, Tet10, Quad8, Quad9, Wedge15, Hex20, Hex27}

function get_integration_order(element::LinearElement)
    return 2
end

function get_integration_order(element::QuadraticElement)
    return 3
end

function get_integration_points(element::LinearElement)
    order = get_integration_order(element)
    get_integration_points(element, order)
end

function get_integration_points(element::QuadraticElement)
    order = get_integration_order(element)
    get_integration_points(element, order)
end

