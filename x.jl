# x.jl - examples of use of summary

include("summary.jl")


using CategoricalArrays, Random

u = ["a", "b", "c"]
x = categorical(u[rand(1:length(u), 1000)])

summary(x)


using RDatasets

iris = dataset("datasets", "iris")

summary(iris.Species)
summary(iris[!, :Species])
summary(iris[!, [:Species]])


### end
