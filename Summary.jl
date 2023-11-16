# Summary.jl


module Summary

export SummaryObject


struct SummaryObject
    labels
    values
    number_missing
end

using CategoricalArrays

import Base.summary

function summary(u::CategoricalVector)
    x = skipmissing(u)
    SummaryObject(levels(u), map(v -> sum(x .== v), levels(x)), sum(ismissing.(u)))
end

using Statistics

function summary(u::Vector{T} where T <: Union{Missing, Number}; kwargs...)
    rho = function(x)
        q = quantile(x, [0.25, 0.5, 0.75])
        [minimum(x), q[1], q[2], mean(x), q[3], maximum(x)]
    end
    labels = ["Min.", "1st Qu.", "Median", "Mean", "3rd Qu.", "Max."]
    n = sum(ismissing.(u))
    raw_values = rho((n > 0) ? skipmissing(u) : u)
    # allow for the behaviour of `round`, the keyword argument `digits` gets
    # priority over `sigdigits` which defaults to 5
    # offer R-style `options`?
    a = Dict(kwargs)
    d = get(a, :digits, :null)
    if d !== :null
        values = round.(raw_values, digits = d)
    else
        d = get(a, :sigdigits, 5)
        values = round.(raw_values, sigdigits = d)
    end
    SummaryObject(labels, values, n)
end


##

function justify(s, n)
    repeat(" ", n - length(s)) * s
end


import Base.show

function show(io::IO, obj::SummaryObject)
    values = string.(obj.values)
    k = maximum(vcat(length.(obj.labels), length.(values))) + 1
    if obj.number_missing > 0
        k = max(k, length("missing") + 1)
    end
    for b in obj.labels
        print(justify(b, k))
    end
    if obj.number_missing > 0
        print(justify("missing", k))
    end
    println("")
    for v in values
        print(justify(v, k))
    end
    if obj.number_missing > 0
        print(justify(string(obj.number_missing), k))
    end
end

end # module Summary


### end
