[![pipeline status](https://git.rwth-aachen.de/nav/PhasedArrayTracking.jl/badges/master/pipeline.svg)](https://git.rwth-aachen.de/nav/PhasedArrayTracking.jl/commits/master)
[![coverage report](https://git.rwth-aachen.de/nav/PhasedArrayTracking.jl/badges/master/coverage.svg)](https://git.rwth-aachen.de/nav/PhasedArrayTracking.jl/commits/master)
# PhasedArrayTracking
This extends [Tracking.jl](https://git.rwth-aachen.de/nav/Tracking.jl) to support phased antenna arrays.

## Getting started

Install:
```julia
] add git@git.rwth-aachen.de:nav/PhasedArrayTracking.jl.git
```

## Usage

```julia
using Tracking, GNSSSignals
import Unitful: Hz
gpsl1 = GPSL1()
carrier_doppler = 100Hz
code_phase = 120
inits = Initials(gpsl1, carrier_doppler, code_phase)
sample_freq = 2.5e6Hz
interm_freq = 0Hz
prn = 1
track = init_tracking(gpsl1, inits, sample_freq, interm_freq, prn)
beamform(x) = x[:,1] # first Antenna
track, track_results = track(signal, beamform)
```

## License

MIT License
