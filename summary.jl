# summary.jl -- a module in the making


using CategoricalArrays

struct CategoricalSummary
    levels
    counts
end

function justify(s, n)
    repeat(" ", n - length(s)) * s
end

function summary(x::CategoricalVector)
    CategoricalSummary(levels(x), map(v -> sum(x .== v), levels(x)))
end

import Base.show

function show(io::IO, obj::CategoricalSummary)
    counts = string.(obj.counts)
    k = maximum(vcat(length.(obj.levels), length.(counts))) + 1
    for v in obj.levels
        print(justify(v, k))
    end
    println("")
    for n in counts
        print(justify(n, k))
    end
end


### end
