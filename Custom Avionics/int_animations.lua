-- this is the animation calculations
defineProperty("frame_time", globalPropertyf("sim/custom/xap/time/frame_time")) -- frame time

-- create datarefs for animations
createProp("sim/custom/xap/throttle/tro_lever_L", "float", 0); -- position of throttle lever
createProp("sim/custom/xap/throttle/tro_lever_R", "float", 0); -- position of throttle lever
createProp("sim/custom/xap/throttle/tro_rev_lever_L", "float", 0); -- position of throttle reverse lever
createProp("sim/custom/xap/throttle/tro_rev_lever_R", "float", 0); -- position of throttle reverse lever

defineProperty("tro_lever_L", globalPropertyf("sim/custom/xap/throttle/tro_lever_L")) -- position of throttle lever
defineProperty("tro_lever_R", globalPropertyf("sim/custom/xap/throttle/tro_lever_R")) -- position of throttle lever
defineProperty("tro_rev_lever_L", globalPropertyf("sim/custom/xap/throttle/tro_rev_lever_L")) -- position of throttle lever
defineProperty("tro_rev_lever_R", globalPropertyf("sim/custom/xap/throttle/tro_rev_lever_R")) -- position of throttle lever


createProp("sim/custom/xap/gear/gear_lever", "int", 0); -- gear lever. -1 = UP, 0 = off, 1 = DOWN
defineProperty("gear_lever", globalPropertyi("sim/custom/xap/gear/gear_lever")) -- gear lever. -1 = UP, 0 = off, 1 = DOWN

createProp("sim/custom/xap/yokes/hide_yokes", "int", 0); -- hide yokes. 0 = show, 1 = hide
defineProperty("hide_yokes", globalPropertyi("sim/custom/xap/yokes/hide_yokes")) -- gear lever. -1 = UP, 0 = off, 1 = DOWN


-- sources
defineProperty("tro_L", globalPropertyf("sim/cockpit2/engine/actuators/throttle_ratio[0]")) -- position of throttle lever
defineProperty("tro_R", globalPropertyf("sim/cockpit2/engine/actuators/throttle_ratio[1]")) -- position of throttle lever

defineProperty("tro_rev_L", globalPropertyf("sim/flightmodel2/engines/thrust_reverser_deploy_ratio[0]")) -- reverse actual position
defineProperty("tro_rev_R", globalPropertyf("sim/flightmodel2/engines/thrust_reverser_deploy_ratio[1]")) -- reverse actual position

defineProperty("sim_gear_lv", globalPropertyi("sim/cockpit2/controls/gear_handle_down")) -- Gear handle location. 0 is up. 1 i down.


function update()
	
	-- thrust levers animation
	local trot_L = get(tro_L)
	local trot_R = get(tro_R)
	local rev_L = get(tro_rev_L)
	local rev_R = get(tro_rev_R)
	
	if rev_L < 0.1 then -- normal work
		set(tro_lever_L, trot_L)
		set(tro_rev_lever_L, 0)
	else -- reverse work
		set(tro_lever_L, 0)
		set(tro_rev_lever_L, rev_L * 0.1 + trot_L * 0.9)	
	end
	
	if rev_R < 0.1 then -- normal work
		set(tro_lever_R, trot_R)
		set(tro_rev_lever_R, 0)
	else -- reverse work
		set(tro_lever_R, 0)
		set(tro_rev_lever_R, rev_R * 0.1 + trot_R * 0.9)	
	end	

---------------------------------	

	-- gear lever
	set(gear_lever, get(sim_gear_lv) * 2 - 1)

---------------------------------
	
	-- yokes
	set(hide_yokes, 0)



end