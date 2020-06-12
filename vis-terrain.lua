local start_time = os.clock()
local do_once = false

function vis_terrain()
    if os.clock() > start_time and do_once == false then
        set("sim/private/controls/skyc/min_dsf_vis_ever", 100000)
        set("sim/private/controls/skyc/max_dsf_vis_ever", 100000)
        do_once = true
    end
end

do_often("vis_terrain()")
