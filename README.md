# GadflyDiff

## Usage

```julia
using Gadfly, GadflyDiff, Interact

@manipulate for n=1:10
  plot(x=rand(n), y=rand(n))
end
```

Updates to the plot as you move the slider for n will be done through [a diff and patch mechanism](https://github.com/shashi/Patchwork.jl).
