local start_time = os.clock()
local do_once = false

function vis_water()
    if os.clock() > start_time and do_once == false then
    --------------------------------------------------------------------
    -- WATER
    --------------------------------------------------------------------
    -- Allan RIVIERE 1.2
    -- set("sim/private/controls/water/fft_amp1", 40)
    -- set("sim/private/controls/water/fft_amp2", 1.5)
    -- set("sim/private/controls/water/fft_amp3", 20)
    -- set("sim/private/controls/water/fft_amp4", 150)
    -- set("sim/private/controls/water/fft_scale1", 30)
    -- set("sim/private/controls/water/fft_scale2", 40)
    -- set("sim/private/controls/water/fft_scale3", 8)
    -- set("sim/private/controls/water/fft_scale4", 2)
    -- set("sim/private/controls/water/noise_speed", 18)
    -- set("sim/private/controls/water/noise_bias_gen_x", 2)
    -- set("sim/private/controls/water/noise_bias_gen_y", 1)

    -- Allan RIVIERE version 1.3 modified
    set("sim/private/controls/water/fft_amp1", 1)
    set("sim/private/controls/water/fft_amp2", 0.8)
    set("sim/private/controls/water/fft_amp3", 2)
    set("sim/private/controls/water/fft_amp4", 20)
    set("sim/private/controls/water/fft_scale1", 240)
    set("sim/private/controls/water/fft_scale2", 20)
    set("sim/private/controls/water/fft_scale3", 16)
    set("sim/private/controls/water/fft_scale4", 3)
    set("sim/private/controls/water/noise_speed", 18)
    set("sim/private/controls/water/noise_bias_gen_x", 2)
    set("sim/private/controls/water/noise_bias_gen_y", 1)

    -- tomvand 2020-02-19
    -- notes:
    -- fft_amp#: wave intensity, higher is stronger
    -- fft_scale#: wave size, higher is smaller
    -- noise_speed: animation speed, lower is faster
    -- noise_bias_gen_x: animation speed factor?, higher is faster
    -- noise_bias_gen_y: animation speed factor?, higher is faster
    -- -- FFT 1 (no idea)
    -- set("sim/private/controls/water/fft_amp1", 5) -- 10
    -- set("sim/private/controls/water/fft_scale1", 240)
    -- -- FFT 2 (static small waves, strongly depends on wind)
    -- set("sim/private/controls/water/fft_amp2", 1) -- 2
    -- set("sim/private/controls/water/fft_scale2", 20)
    -- -- FFT 3 (slow, huge waves (looks like wind gusts))
    -- set("sim/private/controls/water/fft_amp3", 4) -- 8
    -- set("sim/private/controls/water/fft_scale3", 3)
    -- -- FFT 4 (fast, small waves)
    -- set("sim/private/controls/water/fft_amp4", 10) -- 10
    -- set("sim/private/controls/water/fft_scale4", 16)
    -- -- Animation speeds
    -- set("sim/private/controls/water/noise_speed", 10)
    -- set("sim/private/controls/water/noise_bias_gen_x", 1)
    -- set("sim/private/controls/water/noise_bias_gen_y", 1)

    do_once = true
    end
end

do_often("vis_water()")