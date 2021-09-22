local FRAMETIME_LOW = 1.0 / 25.0
local FRAMETIME_HIGH = 1.0 / 28.0

dataref("dr_gpu_time", "sim/time/gpu_time_per_frame_sec_approx", "readonly")
dataref("dr_framerate_period", "sim/time/framerate_period", "readonly")

-- "sim/private/controls/reno/LOD_bias_rat" 5 (fast) - 3.5 (acceptable) - 1.5 (current) - 1 (detailed)

local gpu_unload_step = 0
local cpu_unload_step = 0


local function apply_gpu_unload()
  if gpu_unload_step == 0 then
    -- Clouds
    -- set("enhanced_cloudscapes/rendering_resolution_ratio", 0.41)
    -- set("enhanced_cloudscapes/maximum_sample_step_size", 60.0)
  elseif gpu_unload_step == 1 then
    -- Clouds
    -- set("enhanced_cloudscapes/rendering_resolution_ratio", 0.36)
    -- set("enhanced_cloudscapes/maximum_sample_step_size", 60.0)
  elseif gpu_unload_step == 2 then
    -- Clouds
    -- set("enhanced_cloudscapes/rendering_resolution_ratio", 0.31)
    -- set("enhanced_cloudscapes/maximum_sample_step_size", 60.0)
  elseif gpu_unload_step == 3 then
    -- Clouds
    -- set("enhanced_cloudscapes/rendering_resolution_ratio", 0.31)
    -- set("enhanced_cloudscapes/maximum_sample_step_size", 70.0)
  elseif gpu_unload_step == 4 then
    -- Clouds
    -- set("enhanced_cloudscapes/rendering_resolution_ratio", 0.31)
    -- set("enhanced_cloudscapes/maximum_sample_step_size", 80.0)
  elseif gpu_unload_step > 4 then
    gpu_unload_step = 4
  else
    gpu_unload_step = 0
  end
end

local function apply_cpu_unload()
  if cpu_unload_step == 0 then
    -- Scenery
    set("sim/private/controls/reno/LOD_bias_rat", 1.5)
    -- Cars
    set("sim/private/controls/reno/draw_cars_05", 1)
    set("sim/private/controls/cars/density_factor", 0.5)
    set("sim/private/controls/cars/lod_min", 35000) -- FPS heavy, cars further in distance, adds a lot visually
  elseif cpu_unload_step == 1 then
    -- Scenery
    set("sim/private/controls/reno/LOD_bias_rat", 2.5)
    -- Cars
    set("sim/private/controls/reno/draw_cars_05", 1)
    set("sim/private/controls/cars/density_factor", 0.5)
    set("sim/private/controls/cars/lod_min", 2000)
  elseif cpu_unload_step == 2 then
    -- Scenery
    set("sim/private/controls/reno/LOD_bias_rat", 3.5)
    -- Cars
    set("sim/private/controls/reno/draw_cars_05", 0)
    set("sim/private/controls/cars/density_factor", 0.0)
    set("sim/private/controls/cars/lod_min", 2000)    
  elseif cpu_unload_step > 2 then
    cpu_unload_step = 2
  else
    cpu_unload_step = 0
  end
end


function fps_hero_frame()
  if dr_framerate_period > FRAMETIME_LOW then
    -- Framerate too low
    if dr_framerate_period > dr_gpu_time + 0.01 then
      -- CPU limiting
      cpu_unload_step = cpu_unload_step + 1
      apply_cpu_unload()
    else
      -- GPU limiting
      gpu_unload_step = gpu_unload_step + 1
      apply_gpu_unload()
    end
  end
  if dr_gpu_time < FRAMETIME_HIGH then
    -- GPU can handle more graphics
    gpu_unload_step = gpu_unload_step - 1
    apply_gpu_unload()
  end
  if dr_framerate_period < FRAMETIME_HIGH then
    -- CPU can handle more
    cpu_unload_step = cpu_unload_step - 1
    apply_cpu_unload()
  end
end
do_often("fps_hero_frame()")


function fps_hero_draw()
  if cpu_unload_step > 0 then
    draw_string(32, SCREEN_HIGHT - 32, "CPU! " .. tostring(cpu_unload_step) .. "/2", "red")
  end
  if gpu_unload_step > 0 then
    draw_string(32, SCREEN_HIGHT - 48, "GPU! " .. tostring(gpu_unload_step) .. "/4", "red")
  end
end
do_every_draw("fps_hero_draw()")