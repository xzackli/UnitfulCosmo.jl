# UnitfulCosmo

<!-- [![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://xzackli.github.io/UnitfulCosmo.jl/stable) -->
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://xzackli.github.io/UnitfulCosmo.jl/dev)
[![Build Status](https://github.com/xzackli/UnitfulCosmo.jl/workflows/CI/badge.svg)](https://github.com/xzackli/UnitfulCosmo.jl/actions)
[![Coverage](https://codecov.io/gh/xzackli/UnitfulCosmo.jl/branch/main/graph/badge.svg?token=JBbhog9XqH)](https://codecov.io/gh/xzackli/UnitfulCosmo.jl)

This package implements two specialized unit systems commonly found in cosmology. It is based on Mason Protter's [NaturallyUnitful.jl](https://github.com/MasonProtter/NaturallyUnitful.jl), a different natural unit system that uses eV as the base unit. 

For more information, read the [documentation](https://xzackli.github.io/UnitfulCosmo.jl/dev).

To generate your own conversion factors, you basically solve a linear system using something like this Mathematica code,
```
Solve[ 
 {c m/s == \[HBar]  (kg m^2)/
    s^2 s == \[Epsilon]0 A^2 s^4 kg^-1 m^-3 == 
   kb (kg m^2)/s^2 1/Kelvin == 1},
 { kg, Kelvin, s, A} ]
 ```
 