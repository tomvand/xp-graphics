local ecsc = {
  START_TIME = os.clock(),
  TRANSITION_TIME = 300.0,  -- Transition time in seconds between successive coverage values (0-6)
  COVERAGE_NAMES = {
    [0] = "clear",
    [1] = "cirrus",
    [2] = "few",
    [3] = "scattered",
    [4] = "broken",
    [5] = "overcast",
    [6] = "stratus",
  },
  datarefs = nil,
  preset = nil,
  layers = nil,
  prev_time = os.clock()
}


local function ecsc_find_datarefs()
  local dr = {
    cloud_coverage = {
      [0] = XPLMFindDataRef("sim/weather/cloud_coverage[0]"),
      [1] = XPLMFindDataRef("sim/weather/cloud_coverage[1]"),
      [2] = XPLMFindDataRef("sim/weather/cloud_coverage[2]"),
    },
    base_noise_ratios = {},
    detail_noise_ratios = {},
  }
  for i=1,6 do
    dr.base_noise_ratios[i] = XPLMFindDataRef("enhanced_cloudscapes/" .. ecsc.COVERAGE_NAMES[i] .. "/base_noise_ratios")
    dr.detail_noise_ratios[i] = XPLMFindDataRef("enhanced_cloudscapes/" .. ecsc.COVERAGE_NAMES[i] .. "/detail_noise_ratios")
  end
  if dr.cloud_coverage[0] ~= nil and dr.base_noise_ratios[1] ~= nil then
    ecsc.datarefs = dr
  end
end


local function ecsc_get_preset()
  ecsc.preset = {
    coverage = {},
    density = {},
    base_noise_ratios = {},
    detail_noise_ratios = {},
  }
  for i=1,6 do
    ecsc.preset.coverage[i] = get("enhanced_cloudscapes/" .. ecsc.COVERAGE_NAMES[i] .. "/coverage")
    ecsc.preset.density[i] = get("enhanced_cloudscapes/" .. ecsc.COVERAGE_NAMES[i] .. "/density")
    ecsc.preset.base_noise_ratios[i] = XPLMGetDatavf(ecsc.datarefs.base_noise_ratios[i], 0, 3)
    ecsc.preset.detail_noise_ratios[i] = XPLMGetDatavf(ecsc.datarefs.detail_noise_ratios[i], 0, 3)
  end
  ecsc.preset.coverage[0] = 0.0
  ecsc.preset.density[0] = 0.0
  ecsc.preset.base_noise_ratios[0] = ecsc.preset.base_noise_ratios[1]
  ecsc.preset.detail_noise_ratios[0] = ecsc.preset.detail_noise_ratios[1]
end


local function ecsc_initialize_layers()
  ecsc.layers = {}
  for i=0,2 do
    ecsc.layers[i] = {
      current = XPLMGetDataf(ecsc.datarefs.cloud_coverage[i]),
    }
  end
end


local function ecsc_update_layer_targets()
  for i=0,2 do
    ecsc.layers[i].target = XPLMGetDataf(ecsc.datarefs.cloud_coverage[i])
  end
end


local function interp(vector, index)
  local floor = math.floor(index)
  local frac = index - floor
  
  local a = floor
  local b = floor + 1
  if b == 2 then  -- transition from clear to few, skipping cirrus!
    a = 0
  end
  if b > 6 then  -- bounds checking for possible rounding errors
    b = 6
  end
  return vector[a] + frac * (vector[b] - vector[a])
end


local function interp3(vector3, index)
  local floor = math.floor(index)
  local frac = index - floor

  local a = floor
  local b = floor + 1
  if b == 2 then  -- transition from clear to few, skipping cirrus!
    a = 0
  end
  if b > 6 then  -- bounds checking for possible rounding errors
    b = 6
  end
  return {
    [0] = vector3[a][0] + frac * (vector3[b][0] - vector3[a][0]),
    [1] = vector3[a][1] + frac * (vector3[b][1] - vector3[a][1]),
    [2] = vector3[a][2] + frac * (vector3[b][2] - vector3[a][2]),
  }
end


function ecsc_on_frame()
  -- Late initialization
  if os.clock() < ecsc.START_TIME + 1.0 then
    return
  end
  if ecsc.datarefs == nil then
    ecsc_find_datarefs()
    logMsg("find datarefs")
    return
  elseif ecsc.preset == nil then
    ecsc_get_preset()
    logMsg("get preset")
    return
  elseif os.clock() < ecsc.START_TIME + 10.0 then
    return
  elseif ecsc.layers == nil then
    ecsc_initialize_layers()
    ecsc_update_layer_targets()
    logMsg("initialize layers")
    return
  end

  -- Loop
  -- Update current value for cloud layers
  ecsc_update_layer_targets()
  local dt = os.clock() - ecsc.prev_time
  ecsc.prev_time = os.clock()
  if dt > 0.1 then
    dt = 0.1
  end
  for i=0,2 do
    if ecsc.layers[i].target == 0 then
      ecsc.layers[i].current = 0.0
    elseif ecsc.layers[i].target > 1 and ecsc.layers[i].current < 1 then
      ecsc.layers[i].current = 1.0
    elseif ecsc.layers[i].current < ecsc.layers[i].target - 0.01 then
      ecsc.layers[i].current = ecsc.layers[i].current + 1.0 * dt / ecsc.TRANSITION_TIME
    elseif ecsc.layers[i].current > ecsc.layers[i].target + 0.01 then
      ecsc.layers[i].current = ecsc.layers[i].current - 1.0 * dt / ecsc.TRANSITION_TIME
    end
  end
  -- logMsg("{" .. tostring(ecsc.layers[0].current) .. ", " .. tostring(ecsc.layers[1].current) .. ", " .. tostring(ecsc.layers[2].current) .. "}")
  -- Update 'current' value for coverage types(!)
  -- Take mean when shared between multiple layers
  local cov_current = {}
  for i=1,6 do
    local n = 0
    local sum = 0
    for j=0,2 do
      if ecsc.layers[j].target == i then
        n = n + 1
        sum = sum + ecsc.layers[j].current
      end
    end
    if n > 0 then
      cov_current[i] = sum / n
    end
  end
  -- Write updated values
  for i=1,6 do
    local cov = ecsc.layers[0].current  -- By default, sync cloud settings to layer 0 for smoother weather updates
    if cov_current[i] ~= nil then
      cov = cov_current[i]
    end
    set("enhanced_cloudscapes/" .. ecsc.COVERAGE_NAMES[i] .. "/coverage", interp(ecsc.preset.coverage, cov))
    set("enhanced_cloudscapes/" .. ecsc.COVERAGE_NAMES[i] .. "/density", interp(ecsc.preset.density, cov))
    XPLMSetDatavf(ecsc.datarefs.base_noise_ratios[i], interp3(ecsc.preset.base_noise_ratios, cov), 0, 3)
    XPLMSetDatavf(ecsc.datarefs.detail_noise_ratios[i], interp3(ecsc.preset.detail_noise_ratios, cov), 0, 3)
  end
end
do_every_frame("ecsc_on_frame()")
