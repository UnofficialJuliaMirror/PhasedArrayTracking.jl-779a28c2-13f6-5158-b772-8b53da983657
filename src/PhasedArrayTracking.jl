module PhasedArrayTracking
    using DocStringExtensions, StaticArrays, Tracking

    export prompt,
        init_tracking,
        Initials

    include("discriminators.jl")
    include("tracking_loop.jl")
end
