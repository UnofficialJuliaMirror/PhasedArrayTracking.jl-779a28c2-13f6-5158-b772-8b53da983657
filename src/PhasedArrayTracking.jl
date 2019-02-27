module PhasedArrayTracking
    using DocStringExtensions, StaticArrays, Tracking
    import Unitful: Hz, ms
    import Tracking: prompt, dump!

    export prompt,
        init_tracking,
        TrackingInitials

    include("discriminators.jl")
    include("tracking_loop.jl")
end
