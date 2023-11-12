# x.jl - examples of use of summary

# usage
# 
#   JULIA_LOAD_PATH="$JULIA_LOAD_PATH:$(pwd)" julia
# 

using CategoricalArrays, Random

u = ["a", "b", "c"]
x = categorical(u[rand(1:length(u), 1000)])

using Summary

summary(x)


using RDatasets

iris = dataset("datasets", "iris")

summary(iris.Species)
summary(iris[!, :Species])
summary(iris[!, [:Species]])


### end
