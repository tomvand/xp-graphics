-- Custom cloud settings
set( "sim/private/controls/clouds/ambient_gain", 0.97) -- grayscale ambient lighting
set( "sim/private/controls/clouds/diffuse_gain", 1.2) -- Sky/sun color. Very pinkish during sunset. Also darker on bottom/far side of clouds.
set("sim/private/controls/clouds/spec_gain", 2.0) -- Sun reflection and power through clouds
set( "sim/private/controls/clouds/light_curve_ratio", 1.0) -- Controls darker cloud bottom. Multiplied with curve_power in some way.
set( "sim/private/controls/clouds/light_curve_power", 0.5)
-- set( "sim/private/controls/clouds/plot_radius", 1.4) -- Slightly bigger
set( "sim/private/controls/skyc/fog_start_lo_alt", 0.5) -- Cloud drawing distance from below

-- From cloud art
set( "sim/private/controls/clouds/first_res_3d", 3)
set( "sim/private/controls/clouds/last_res_3d", 5)
set( "sim/private/controls/clouds/overdraw_control", 0.1)
-- set( "sim/private/controls/clouds/shad_radius" , 1.0)
-- set( "sim/private/controls/clouds/shad_alpha_dry" , 0.5)
-- set( "sim/private/controls/clouds/shad_alpha_wet", 0)
set( "sim/private/controls/clouds/count_ratio/0",0.5)
set( "sim/private/controls/clouds/count_ratio/1",0.5)
set( "sim/private/controls/clouds/count_ratio/2",0.5)
set( "sim/private/controls/clouds/count_ratio/3",0.5)
set( "sim/private/controls/clouds/count_ratio/4",0.5)
set( "sim/private/controls/clouds/check_z_hdr", 0.00)
-- set( "sim/private/controls/skyc/shadow_level_clean", 1.000000)
-- set( "sim/private/controls/skyc/shadow_level_ocast", 1.000000)
-- set( "sim/private/controls/clouds/cloud_shadow_lighten_ratio",  1.00)
-- set( "sim/private/controls/clouds/shad_radius", 0.6)
-- set( "sim/private/controls/shadow/adhoc/extra_far",  1.0 )
-- set( "sim/private/controls/shadow/bias_const",  0.0 )
-- set( "sim/private/controls/shadow/bias_slope",  1.0 )
-- set( "sim/private/controls/shadow/extra_near",  1.0 )
-- set( "sim/private/controls/shadow/overlap_ratio",  0.001000 )






-- T r u e H a z e --

--atmosphere parameters

set( "sim/private/controls/atmo/atmo_scale_raleigh",        19 )
set( "sim/private/controls/atmo/inscatter_gain_mie",     1.0 )
set( "sim/private/controls/atmo/inscatter_gain_raleigh",         1.0 )
set( "sim/private/controls/atmo/scatter_raleigh_b",         20.0 )
set( "sim/private/controls/atmo/scatter_raleigh_g",       10.00 )
set( "sim/private/controls/atmo/scatter_raleigh_r",     2.5 )
set( "sim/private/controls/hdr/sky_gain",     	3.5 )
set( "sim/private/controls/hdr/white_point",     	3.5 )


set( "sim/private/controls/fog/fog_be_gone",    1.6 )
set( "sim/private/controls/terrain/fog_clip_pad",    1500.0 )
set( "sim/private/controls/terrain/fog_clip_scale",    0.0 )


--clouds lighting

-- set( "sim/private/controls/clouds/ambient_gain",       1.05 )
-- set( "sim/private/controls/clouds/diffuse_gain",       1.39 )
-- set( "sim/private/controls/clouds/spec_gain",        2.0 )
-- set( "sim/private/controls/clouds/light_curve_power",  1.2)
-- set( "sim/private/controls/clouds/light_curve_ratio",  1.0)



--clouds draw settings

-- set( "sim/private/controls/clouds/first_res_3d", 3)
-- set( "sim/private/controls/clouds/last_res_3d", 5)
-- set( "sim/private/controls/clouds/limit_far",  1.0)
-- set( "sim/private/controls/clouds/soft_occlude",  1.0)

set( "sim/private/controls/clouds/plot_radius",  1.2)


--clouds density

-- set( "sim/private/controls/cloud/fade_far_end",       1.925 )
-- set( "sim/private/controls/cloud/fade_far_start",     0.100 )
-- set( "sim/private/controls/cloud/fade_near_end",       0.00 )
-- set( "sim/private/controls/cloud/fade_near_start",   -1.000 )

-- set( "sim/private/controls/clouds/overdraw_control", 0.9)



--clouds resolution

-- set( "sim/private/controls/cloud/offscreen_res_tight", 4.0)
-- set( "sim/private/controls/cloud/offscreen_scale", 0.986563)
-- set( "sim/private/controls/cloud/offscreen_tight", 1.0)
-- set( "sim/private/controls/cloud/offscreen_tweak", 1.0)

set( "sim/private/controls/clouds/image_size_x", 4096.0)
set( "sim/private/controls/clouds/image_size_y", 4096.0)



--sun parameters

set( "sim/private/controls/dome/sun_gain_1_hdr", 1.00)
set( "sim/private/controls/dome/sun_gain_2_hdr", 1.90)

set( "sim/private/controls/skyc/min_tone_angle", -100)
set( "sim/private/controls/skyc/max_tone_angle", -100)


--scenery draw distance

set( "sim/private/controls/skyc/max_dsf_vis_ever", 110000)
set( "sim/private/controls/skyc/dsf_fade_ratio", 0.5)
set( "sim/private/controls/skyc/dsf_cutover_scale", 3)


--SKY COLORS PARAMETERS

--clean

set( "sim/private/controls/skyc/ambient_ratio_clean", 0.30)
set( "sim/private/controls/skyc/direct_ratio_clean", 0.3)
set( "sim/private/controls/skyc/mie_scattering_clean", 0.600)
set( "sim/private/controls/skyc/raleigh_scattering_clean", 0.3420)
set( "sim/private/controls/skyc/shadow_level_clean", 1.00)
set( "sim/private/controls/skyc/shadow_offset_clean", 1.00)
set( "sim/private/controls/skyc/tone_ratio_clean", 0.8)

--mount

set( "sim/private/controls/skyc/ambient_ratio_mount", 0.30)
set( "sim/private/controls/skyc/direct_ratio_mount", 1.000)
set( "sim/private/controls/skyc/mie_scattering_mount", 0.200)
set( "sim/private/controls/skyc/raleigh_scattering_mount", 0.29)
set( "sim/private/controls/skyc/shadow_level_mount", 1.00)
set( "sim/private/controls/skyc/shadow_offset_mount", 1.00)
set( "sim/private/controls/skyc/tone_ratio_mount", 0.8)





set( "sim/private/controls/skyc/tone_ratio_foggy", 0.4)
set( "sim/private/controls/skyc/tone_ratio_hazy",  0.3)
set( "sim/private/controls/skyc/tone_ratio_snowy", 0.5)
set( "sim/private/controls/skyc/tone_ratio_ocast", 0.2)
set( "sim/private/controls/skyc/tone_ratio_strat", 1.5)
set( "sim/private/controls/skyc/tone_ratio_hialt", 0)

set( "sim/private/controls/skyc/shadow_level_hazy", 0.6)
set( "sim/private/controls/skyc/shadow_level_foggy", 0.33)
set( "sim/private/controls/skyc/shadow_level_ocast", 0.2)







--TRUEHAZE INTERNAL PARAMETERS 
--adapted from "gradualvisibility_100_stable.lua, coded by Aritana Bahia Schlumbom 

local limit_toMaxVisibility = true; --use the max visibility over the "atmoTop_visibility" elevation or use default x-plane infinite visibility
local max_visibility = 100000; --horizontal visivility over "atmoTop_visibility" elevation, default is 100000
local cloudTop_visibility = 1300; -- when above the first cloud base the visivility start to increase, default is  1500 m (4921 ft)
local atmoTop_visibility = 7620; --elevation to apply the max_visibility, default is 7620 m (FL250)

--INTERNAL VARIABLES (Don�t change!)
dataref("gnd_imm_max","sim/private/controls/skyc/gnd_imm_max", "writable")
dataref("gnd_imm_min","sim/private/controls/skyc/gnd_imm_min", "writable")
dataref("lit_imm_max","sim/private/controls/skyc/lit_imm_max", "writable")
dataref("lit_imm_min","sim/private/controls/skyc/lit_imm_min", "writable")
dataref("vis_graphical","sim/private/stats/skyc/fog/far_fog_unlit", "readonly")
dataref("vis_graphical_cld","sim/private/stats/skyc/fog/near_fog_cld", "readonly")
dataref("vis_graphical_near","sim/private/stats/skyc/fog/near_fog_unlit", "readonly")
dataref("imm_rat_sky","sim/private/stats/skyc/imm_rat_sky", "readonly")
dataref("visibility_reported_m","sim/weather/visibility_reported_m", "readonly")
dataref("first_cloud_base","sim/weather/cloud_base_msl_m[0]", "readonly")
dataref("pilot_alt_agl","sim/flightmodel/position/y_agl", "readonly")
dataref("elevation","sim/flightmodel/position/elevation", "readonly")
dataref("realFrame_time","sim/operation/misc/frame_rate_period","readonly")

local fog_state = 0;
local infoBox_x = 40;
local infoBox_y = 600;
local target_vis = -1;
local gnd_imm_min_rate = 0.03;
gnd_imm_max = 1.0;
gnd_imm_min = 0.9
local tolerance = 0.05;
local plugin_on = false;

function verify_visbility()	
	if elevation >= first_cloud_base then			
		target_vis = get_targetVis();
		if vis_graphical < target_vis-target_vis*tolerance or vis_graphical > target_vis+target_vis*tolerance then  
			if target_vis > 0 then			
				change_visibility( target_vis )
			elseif plugin_on then
				plugin_on = false;				
			end
		end
	else
		plugin_on = false
	end
	
	if plugin_on == false then
		if	gnd_imm_max ~= 1 then
			if gnd_imm_min > -0.9 then
				gnd_imm_min = gnd_imm_min - 3*realFrame_time
				lit_imm_min = gnd_imm_min
				fog_state = -1				
			else
				gnd_imm_max = 1
				lit_imm_max = 1
				gnd_imm_min = 0.9
				lit_imm_min = 0.9
				fog_state = 0
			end
		end	
	end
end

function change_visibility( target_vis )			
		gnd_imm_min_rate = 0.2*realFrame_time;
		if fog_state == 0 then
			gnd_imm_max = -1;
			gnd_imm_min = -0.9;
			fog_state = 1;
		elseif fog_state == 1 then
			if gnd_imm_min > 0 then
				fog_state = 2;
			elseif gnd_imm_min < -0.9 then
				fog_state = 3;
			end
		elseif fog_state == 2 then
			if gnd_imm_min <= 0 then
				fog_state = 1;
			end
			gnd_imm_min_rate = gnd_imm_min_rate*5;
		elseif fog_state == 3 then
			gnd_imm_max = 1
			gnd_imm_min = 0.9
			fog_state = 0
			plugin_on = false;
			return 0
		end
		
		plugin_on = true;
		if vis_graphical > target_vis then
			if (vis_graphical - target_vis) < 2000 then
				gnd_imm_min =  gnd_imm_min + gnd_imm_min_rate;
			else
				gnd_imm_min =  gnd_imm_min + gnd_imm_min_rate*20;
			end
		else
			gnd_imm_min =  gnd_imm_min - gnd_imm_min_rate*2;	
		end			
		lit_imm_max = gnd_imm_max
		lit_imm_min = gnd_imm_min
		
end


function get_targetVis()
	if (atmoTop_visibility-(cloudTop_visibility+first_cloud_base)) <= 0 then 
		return -1 
	end	
	if  imm_rat_sky > 0.1 then return -1 end
	
	if elevation > atmoTop_visibility then 
		if limit_toMaxVisibility then return max_visibility
		else
			if plugin_on then
				return 1000000;
			else
				return -1;
			end
		end
	end
	local cloud_topReference = cloudTop_visibility;
	if visibility_reported_m < 4000 then 
		cloud_topReference = cloudTop_visibility*2.65 
	elseif visibility_reported_m < 15000 then
		cloud_topReference = cloudTop_visibility*1.75
	end
	cloud_topReference = cloud_topReference + first_cloud_base
	
	if elevation < cloud_topReference then
		return visibility_reported_m;
	else		 
		local d = elevation-cloud_topReference;
		local h = atmoTop_visibility-cloud_topReference;		
		local ratio = d/h;
		local visibility = (1-ratio)*visibility_reported_m + max_visibility*ratio
		return visibility;
	end	
end

function draw_infoRTW()	 
	graphics.set_color( 0, 0, 0)
	local line_pos = 0;
	if plugin_on then
		draw_string_Helvetica_12( infoBox_x, infoBox_y+line_pos, "status: ON" )
	else
		draw_string_Helvetica_12( infoBox_x, infoBox_y+line_pos, "status: OFF" )
	end
	line_pos = line_pos-12;
	draw_string_Helvetica_12( infoBox_x, infoBox_y+line_pos, "reported_vis:" .. visibility_reported_m )
	line_pos = line_pos-12;
	draw_string_Helvetica_12( infoBox_x, infoBox_y+line_pos, "efetive_vis:" .. vis_graphical )
	line_pos = line_pos-12;
	draw_string_Helvetica_12( infoBox_x, infoBox_y+line_pos, "calculated_vis:" .. target_vis )
	line_pos = line_pos-12;
	draw_string_Helvetica_12( infoBox_x, infoBox_y+line_pos, "fog_state:" .. fog_state )
	line_pos = line_pos-12;
	draw_string_Helvetica_12( infoBox_x, infoBox_y+line_pos, "elevation:" .. elevation )
end

--do_every_draw("draw_infoRTW()")

function step_cycleVIS()    
	verify_visbility()
end

do_every_frame("step_cycleVIS()")
