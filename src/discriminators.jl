function veryearly(x::SMatrix{N,A,T}) where {N,A,T}
    x[(N - 1) >> 1 + 3,:]
end

function early(x::SMatrix{N,A,T}) where {N,A,T}
    x[(N - 1) >> 1 + 2,:]
end

function prompt(x::SMatrix{N,A,T}) where {N,A,T}
    x[(N - 1) >> 1 + 1,:]
end

function late(x::SMatrix{N,A,T}) where {N,A,T}
    x[(N - 1) >> 1,:]
end

function verylate(x::SMatrix{N,A,T}) where {N,A,T}
    x[(N - 1) >> 1 - 1,:]
end
