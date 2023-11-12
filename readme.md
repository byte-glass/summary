# R's `summary` for julia

## next steps
 - boolean vector as a special case of a categorical vector?
 - numerical vector
 - dataframe?

## latest
 - make a module of summary.jl
 - `summary` exists in `Base`! Who knew?!
 - introduce `CategoricalSummary` object and `show` method for it
 - first straightforward version of `summary` for categorical data

## `summary` and `Base`

The function defined in `Summary.jl` (seems to) behave as expected i.e. it extends the behaviour of `Base`. For example,

```julia
using CategoricalArrays, Random

u = ["a", "b", "c"]
x = categorical(u[rand(1:length(u), 1000)])

summary(x)
```
=>
    "1000-element CategoricalArray{String,1,UInt32}"                                     

After `using Summary`,

```julia
using Summary                                                                 

summary(x)
```
=>
       a   b   c                                                                         
     319 354 327

Note: there is no need to `export summary` from `Summary.jl`.

## invocation

Make sure the current directory is on the julia load path, e.g.
 
```sh
JULIA_LOAD_PATH="$JULIA_LOAD_PATH:$(pwd)" julia -i x.jl
```


### end
