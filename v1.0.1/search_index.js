var documenterSearchIndex = {"docs":
[{"location":"api_index/#Index","page":"API","title":"Index","text":"","category":"section"},{"location":"api_index/","page":"API","title":"API","text":"","category":"page"},{"location":"api_index/","page":"API","title":"API","text":"Modules = [UnitfulCosmo]","category":"page"},{"location":"api_index/#UnitfulCosmo.mpc-Tuple{Any}","page":"API","title":"UnitfulCosmo.mpc","text":"mpc(q; base=u\"Mpc\")\n\nConvert q to Mpc units based on the units specified by base. If base is unspecified, mpc will default to Mpc. You could choose some other length unit if you wanted.\n\n\n\n\n\n","category":"method"},{"location":"api_index/#UnitfulCosmo.planck-Tuple{Any}","page":"API","title":"UnitfulCosmo.planck","text":"planck(q)\n\nStrip units by inserting whatever ħ, c, G and kb are required to make the conversion work.\n\n\n\n\n\n","category":"method"},{"location":"api_index/#UnitfulCosmo.unmpc-Tuple{Any,Any}","page":"API","title":"UnitfulCosmo.unmpc","text":"unmpc(targetUnit, q)\n\nConvert a quantity q to units specified by targetUnits automatically inserting whatever factors  of ħ, c, ϵ₀ and kb are required to make the conversion work.\n\n\n\n\n\n","category":"method"},{"location":"api_index/#UnitfulCosmo.unplanck-Tuple{Any,Any}","page":"API","title":"UnitfulCosmo.unplanck","text":"unplanck(targetUnit, q)\n\nConvert a quantity q to units specified by targetUnits automatically inserting whatever factors  of ħ, c, G and kb are required to make the conversion work.\n\n\n\n\n\n","category":"method"},{"location":"","page":"Home","title":"Home","text":"CurrentModule = UnitfulCosmo","category":"page"},{"location":"#UnitfulCosmo","page":"Home","title":"UnitfulCosmo","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"This package implements two specialized unit systems commonly found in cosmology. It is based on Mason Protter's NaturallyUnitful.jl, a different natural unit system that uses eV as the base unit[1].  It re-exports both Unitful and UnitfulAstro, so you only need to load this package.","category":"page"},{"location":"","page":"Home","title":"Home","text":"[1]: Natural System of Units in General Relativity, Myers","category":"page"},{"location":"#Planck-Units","page":"Home","title":"Planck Units","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"hbar = c = G = k_B = 1","category":"page"},{"location":"","page":"Home","title":"Home","text":"These units eliminate all dimensionality. When you convert quantities with units into this system, you make everything dimensionless by multiplying powers of the fundamental physical constants. This does mean you lose unit information, but it's also very convenient since your equations don't have any fundamental constants in them! The price of this simplicity is any scales which are unnatural (i.e. far away from combinations of the fundamental constants) require significands very different from 1. For example, the Hubble constant is very small, H_0 sim 10^-61.","category":"page"},{"location":"","page":"Home","title":"Home","text":"UnitfulCosmo exports a function planck(quantity) which converts a quantity with units into its dimensionless value in Planck units. To convert back, use unplanck(desired_unit, value). ","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> using UnitfulCosmo\n\njulia> planck(2.725u\"K\")\n1.9233698913253178e-32\n\njulia> unplanck(u\"K\", 1.9233698913253178e-32)\n2.725 K","category":"page"},{"location":"#Mpc-Units","page":"Home","title":"Mpc Units","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"hbar = c = epsilon_0 = k_B = 1","category":"page"},{"location":"","page":"Home","title":"Home","text":"Note that G neq 1. This leaves one free dimension, and this unit system makes Megaparsec (Mpc) the base unit. In this unit system, both length and time are measured in Mpc, whereas mass, temperature, and current are measured in inverse Mpc. These units are often used for studies of the large scale structure of the Universe. Many cosmological theory codes use these units: they map naturally to observables, the important quantities H_0 and wavenumbers k have small significands in this system, and a lot of the constants are unity. ","category":"page"},{"location":"","page":"Home","title":"Home","text":"The downside to this system is that you want to avoid using the gravitational constant G. The price of nice constants and H_0 is that G sim 2 times 10^-115  textMpc^2, which is very cumbersome. Fortunately, in the Boltzmann equations G only appears in the form Grhoc^2, which has dimensions of H_0^2c^2 (thanks Antony Lewis).","category":"page"},{"location":"","page":"Home","title":"Home","text":"UnitfulCosmo exports a function mpc(quantity) which converts a quantity with units into its equivalent in powers of Mpc. To convert back, use unmpc(desired_unit, length). ","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> mpc(70u\"km/s/Mpc\")\n0.00023349486663870643 Mpc^-1\n\njulia> unmpc(u\"km/s/Mpc\", 0.00023349486663870643u\"Mpc^-1\")\n70.0 km Mpc^-1 s^-1","category":"page"},{"location":"","page":"Home","title":"Home","text":"If you're really crazy, you can choose a different base length unit, with mpc(q; base=u\"Mpc\").","category":"page"}]
}
