"""
$(SIGNATURES)

Initialize tracking function

"""
function init_tracking(::Val{N}, system, inits, sample_freq, interm_freq, sat_prn; pll_bandwidth = 18Hz, dll_bandwidth = 1Hz, min_integration_time = 0.5ms, max_integration_time = 1ms, carrier_loop_func = init_3rd_order_bilinear_loop_filter, code_loop_func = init_2nd_order_bilinear_loop_filter) where N
    code_shift = CodeShift{3}(system, sample_freq, 0.5) # 3: Early, Prompt, Late
    dopplers = Dopplers(inits)
    phases = Phases(inits)
    carrier_loop = carrier_loop_func(pll_bandwidth)
    code_loop = code_loop_func(dll_bandwidth)
    correlator_outputs = init_correlator_outputs(Val(N), code_shift)
    data_bits = DataBits(system)
    last_valid_correlator_outputs = copy(correlator_outputs)
    req_signal_and_track(correlator_outputs, last_valid_correlator_outputs, system, sample_freq, interm_freq, inits, dopplers, phases, code_shift, carrier_loop, code_loop, sat_prn, min_integration_time, max_integration_time, 0, data_bits)
end

function init_correlator_outputs(::Val{A}, code_shift::CodeShift{N}) where N, A
    zeros(SMatrix{N, A, ComplexF64})
end

Base.@propagate_inbounds function dump!(output, signal::Matrix, output_idx, sample, code_carrier)
    for ant_idx = 1:size(output, 1)
        @fastmath output[output_idx,ant_idx] += signal[sample,ant_idx] * code_carrier
    end
end
