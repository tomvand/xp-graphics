local cars_lod_min = 20000

function vis_cars()
  local fps = 1.0 / get("sim/time/framerate_period")

  if fps > 42.0 and cars_lod_min < 100000 then
    cars_lod_min = cars_lod_min + 10000 / fps
    if cars_lod_min > 100000 then
      cars_lod_min = 100000
    end
    set("sim/private/controls/cars/lod_min", cars_lod_min)
  elseif fps < 38 and cars_lod_min > 20000 then
    cars_lod_min = cars_lod_min - 20000 / fps
    if cars_lod_min < 20000 then
      cars_lod_min = 20000
    end
    set("sim/private/controls/cars/lod_min", cars_lod_min)
  end
end

do_every_frame("vis_cars()")