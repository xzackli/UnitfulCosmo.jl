# UnitfulCosmo

<!-- [![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://xzackli.github.io/UnitfulCosmo.jl/stable) -->
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://xzackli.github.io/UnitfulCosmo.jl/dev)
[![Build Status](https://github.com/xzackli/UnitfulCosmo.jl/workflows/CI/badge.svg)](https://github.com/xzackli/UnitfulCosmo.jl/actions)
[![Coverage](https://codecov.io/gh/xzackli/UnitfulCosmo.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/xzackli/UnitfulCosmo.jl)

This package implements two specialized unit systems commonly found in cosmology. It is based on Mason Protter's [NaturallyUnitful.jl](https://github.com/MasonProtter/NaturallyUnitful.jl), another natural unit system that uses eV as the base unit. 

### Planck Units
This sets `ħ = c = G = kb = 1`, eliminating all dimensionality from the unit system. When you convert quantities with units into this system, you make everything dimensionless by applying factors of the fundamental constants. This does mean you lose unit information, but it's also very convenient since your equations don't have any fundamental constants in them anymore. 

This unit system has some large exponents; for example, H₀ ~ 10⁻⁶¹.

### Mpc Units
This sets `ħ = c = ϵ₀ = kb = 1` but `G ≠ 1`, and uses the Megaparsec (Mpc) as the base unit. In this unit system, both length and time are measured in Mpc, whereas mass, temperature, and current are measured in inverse Mpc. These units are often used for studies of the large scale structure of the Universe. Most cosmological theory codes use these units, in particular because H₀ and wavenumbers k are nice in this system, and a lot of the constants are 1. 

The downside to this system is that you want to avoid using `G`. The price of using natural units and also having a nice H₀ is that G ~ 2 × 10⁻¹¹⁵ Mpc², which is very cumbersome. Fortunately, in the Boltzmann equations G only appears in the form Gρ/c², which has dimensions of H₀²/c² (thanks Antony Lewis).