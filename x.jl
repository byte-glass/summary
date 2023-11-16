# x.jl - examples of use of summary

# usage
# 
#   JULIA_LOAD_PATH="$JULIA_LOAD_PATH:$(pwd)" julia
# 


using Summary

##

using CategoricalArrays, Random

u = ["a", "b", "c"] # [:x, :y, :z] 
x = categorical(u[rand(1:length(u), 100)])

summary(x)

##

v = Array{Union{Missing, String}}(missing, 10)
v[:] = u[rand(1:length(u), 10)]
v[3] = missing
w = categorical(v)

summary(w)

##

using RDatasets

iris = dataset("datasets", "iris")

summary(iris.Species)
summary(iris[!, :Species])
summary(iris[!, [:Species]])

##

s = Array{Union{Missing, String}}(iris.Species)
s[150] = missing

summary(categorical(s))

##

x = randn(100)
summary(x)

##

n = 10

x = Array{Union{Float64, Missing}}(missing, n)
x[:] = randn(10)
x[2] = missing

summary(x)


### end
