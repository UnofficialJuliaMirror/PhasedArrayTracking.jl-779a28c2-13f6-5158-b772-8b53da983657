module PhasedArrayTracking
    using DocStringExtensions, StaticArrays, Tracking
    import Tracking: prompt, dump!

    export prompt,
        init_tracking,
        Initials

    include("discriminators.jl")
    include("tracking_loop.jl")
end
