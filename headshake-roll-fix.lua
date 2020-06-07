-- The headshake plugin leaves a roll offset in the graphics settings, which is annoying
start_time = os.clock()
do_once = false

function headshake_roll_fix()
    if os.clock() > start_time and do_once == false then
        set("sim/graphics/view/field_of_view_roll_deg", 0.0)
        do_once = true
    end
end