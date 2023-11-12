# summary.jl -- a module in the making

function justify(s, n)
    repeat(" ", n - length(s)) * s
end

function summary(x)
    v = levels(x)
    counts = map(v -> sum(x .== v), levels(x))
    n = string.(counts)
    k = maximum(vcat(length.(v), length.(n))) + 1
    for u in v
        print(justify(u, k))
    end
    println("")
    for j in n
        print(justify(j, k))
    end
end


### end
