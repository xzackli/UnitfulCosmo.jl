using UnitfulCosmo
using Documenter

makedocs(;
    modules=[UnitfulCosmo],
    authors="Zack Li",
    repo="https://github.com/xzackli/UnitfulCosmo.jl/blob/{commit}{path}#L{line}",
    sitename="UnitfulCosmo.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://xzackli.github.io/UnitfulCosmo.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "API" => "api_index.md"
    ],
)

deploydocs(;
    repo="github.com/xzackli/UnitfulCosmo.jl",
    devbranch = "main"
)
