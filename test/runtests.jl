using Test, PhasedArrayTracking, StaticArrays, GNSSSignals, Tracking
import Unitful: Hz, s, ms

include("discriminators.jl")
include("tracking_loop.jl")
