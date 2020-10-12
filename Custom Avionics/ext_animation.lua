-- this is the animation calculations
defineProperty("frame_time", globalPropertyf("sim/custom/xap/time/frame_time")) -- frame time

-- enviroment
defineProperty("gforce", globalPropertyf("sim/flightmodel2/misc/gforce_normal"))
defineProperty("airspeed", globalPropertyf("sim/cockpit2/gauges/indicators/airspeed_kts_pilot"))


-- wing flex sources
defineProperty("fuel_q_1", globalPropertyf("sim/flightmodel/weight/m_fuel[0]")) -- fuel quantity for tank 1
defineProperty("fuel_q_2", globalPropertyf("sim/flightmodel/weight/m_fuel[2]")) -- fuel quantity for tank 3

-- landing gear sources
defineProperty("gear1_deflect", globalPropertyf("sim/flightmodel2/gear/tire_vertical_deflection_mtr[0]"))  -- vertical deflection of front gear
defineProperty("gear2_deflect", globalPropertyf("sim/flightmodel2/gear/tire_vertical_deflection_mtr[1]"))  -- vertical deflection of left gear
defineProperty("gear3_deflect", globalPropertyf("sim/flightmodel2/gear/tire_vertical_deflection_mtr[2]"))  -- vertical deflection of right gear
defineProperty("gear4_deflect", globalPropertyf("sim/flightmodel2/gear/tire_vertical_deflection_mtr[3]"))  -- vertical deflection of left aft gear
defineProperty("gear5_deflect", globalPropertyf("sim/flightmodel2/gear/tire_vertical_deflection_mtr[4]"))  -- vertical deflection of right aft gear

-- RAT sources
defineProperty("ram_air_turbine_on", globalPropertyf("sim/operation/failures/ram_air_turbine_on"))  -- boolean	Ram air turbine is on?


-- custom animation
createProp("sim/custom/xap/wings/wing_flex_L", "float", 0); -- angle of wing flex. degrees, positive UP
defineProperty("wing_flex_L", globalPropertyf("sim/custom/xap/wings/wing_flex_L")) -- angle of wing flex. degrees, positive UP
createProp("sim/custom/xap/wings/wing_flex_R", "float", 0); -- angle of wing flex. degrees, positive UP
defineProperty("wing_flex_R", globalPropertyf("sim/custom/xap/wings/wing_flex_R")) -- angle of wing flex. degrees, positive UP

createProp("sim/custom/xap/gears/gear_deflect_F", "float", 0); -- meters of gear deflection under plane's weight
createProp("sim/custom/xap/gears/gear_deflect_L", "float", 0); -- meters of gear deflection under plane's weight
createProp("sim/custom/xap/gears/gear_deflect_R", "float", 0); -- meters of gear deflection under plane's weight
createProp("sim/custom/xap/gears/gear_cart_angle_L", "float", 0); -- rotation of gear's cart. positive degrees - front gear UP
createProp("sim/custom/xap/gears/gear_cart_angle_R", "float", 0); -- rotation of gear's cart. positive degrees - front gear UP
createProp("sim/custom/xap/gears/gear_cable_1_L", "float", 0); -- rotation of gear cables
createProp("sim/custom/xap/gears/gear_cable_1_R", "float", 0); -- rotation of gear cables

defineProperty("gear_deflect_F", globalPropertyf("sim/custom/xap/gears/gear_deflect_F")) -- meters of gear deflection under plane's weight
defineProperty("gear_deflect_L", globalPropertyf("sim/custom/xap/gears/gear_deflect_L")) -- meters of gear deflection under plane's weight
defineProperty("gear_deflect_R", globalPropertyf("sim/custom/xap/gears/gear_deflect_R")) -- meters of gear deflection under plane's weight
defineProperty("gear_cart_angle_L", globalPropertyf("sim/custom/xap/gears/gear_cart_angle_L")) -- rotation of gear's cart. positive degrees - front gear UP
defineProperty("gear_cart_angle_R", globalPropertyf("sim/custom/xap/gears/gear_cart_angle_R")) -- rotation of gear's cart. positive degrees - front gear UP

defineProperty("gear_cable_1_L", globalPropertyf("sim/custom/xap/gears/gear_cable_1_L")) -- rotation of gear cables
defineProperty("gear_cable_1_R", globalPropertyf("sim/custom/xap/gears/gear_cable_1_R")) -- rotation of gear cables

createProp("sim/custom/xap/rat/rat_deploy_ratio", "float", 0); -- position of Ram Air Turbine
createProp("sim/custom/xap/rat/rat_angle", "float", 0); -- position of Ram Air Turbine prop
createProp("sim/custom/xap/rat/rat_RPM", "float", 0); -- rotation speed of Ram Air Turbine prop

defineProperty("rat_deploy_ratio", globalPropertyf("sim/custom/xap/rat/rat_deploy_ratio")) -- position of Ram Air Turbine
defineProperty("rat_angle", globalPropertyf("sim/custom/xap/rat/rat_angle")) -- position of Ram Air Turbine
defineProperty("rat_RPM", globalPropertyf("sim/custom/xap/rat/rat_RPM")) -- position of Ram Air Turbine


local G_coef = 0.85 -- coefficient of wing flex by G overload
local gear_coef = 4 -- coefficient of wing flex by landing gear pressure on ground
local fuel_coef = 0.00004 -- coefficient of wing flex by fuel weight

local RAT_ON_last = get(ram_air_turbine_on)
local RAT_angle = 0
local rat_moving = false

local temp_counter = 0

local angle_L_act = 0
local angle_R_act = 0

function update()
	
	local passed = get(frame_time)
	
	-- gear 
	local front_g_def = get(gear1_deflect)
	local left_front_def = get(gear2_deflect)
	local left_aft_def = get(gear4_deflect)
	local right_front_def = get(gear3_deflect)
	local right_aft_def = get(gear5_deflect)
	
	local left_gear_deflect = (left_aft_def + math.max(left_front_def - 0.2, 0)) * 0.5 --math.min((left_front_def + left_aft_def) / 2, 0.5)
	local right_gear_deflect = (right_aft_def + math.max(right_front_def - 0.2, 0)) * 0.5 --math.min((right_front_def + right_aft_def) / 2, 0.5)
	local left_gear_rotate = (left_front_def - left_aft_def) * 70
	local right_gear_rotate = (right_front_def - right_aft_def) * 70
	
	set(gear_deflect_F, front_g_def) -- front gear deflection
	set(gear_deflect_L, left_gear_deflect) -- left gear deflection
	set(gear_deflect_R, right_gear_deflect) -- right gear deflection
	set(gear_cart_angle_L, left_gear_rotate) -- left cart angle
	set(gear_cart_angle_R, right_gear_rotate) -- right cart angle
	

	-- gear cables
	set(gear_cable_1_L, left_gear_deflect * 80 - left_gear_rotate )
	set(gear_cable_1_R,  right_gear_deflect * 80 - right_gear_rotate )
	
	
	----------------------------

	-- wing flex
	local G = get(gforce) - 1
	local gear_vert_defl = front_g_def + left_gear_deflect + right_gear_deflect
	local fuel_tank_weight_L = get(fuel_q_1)
	local fuel_tank_weight_R = get(fuel_q_2)
	
	local angle_L = 0.5 + G * G_coef - gear_vert_defl * gear_coef * (fuel_tank_weight_L * fuel_coef * 0.5 + 0.5) - fuel_tank_weight_L * fuel_coef * G
	local angle_R = 0.5 + G * G_coef - gear_vert_defl * gear_coef * (fuel_tank_weight_R * fuel_coef * 0.5 + 0.5) - fuel_tank_weight_R * fuel_coef * G
	
	angle_L_act = angle_L_act + (angle_L - angle_L_act) * passed * (1 - fuel_tank_weight_L * 0.00001) * 4
	angle_R_act = angle_R_act + (angle_R - angle_R_act) * passed * (1 - fuel_tank_weight_R * 0.00001) * 4
	
	set(wing_flex_L, angle_L_act)
	set(wing_flex_R, angle_R_act)


	-- just for fun :)
--[[
	temp_counter = temp_counter + passed * 2

	set(wing_flex_L, 10 * math.sin(temp_counter))
	set(wing_flex_R, 10 * math.sin(temp_counter)) --]]
	----------------------
	
	-- RAT
	
	-- RAT deployment and fix
	local RAT_ON = get(ram_air_turbine_on) -- current RAT position from sim
	local RAT_deploy = get(rat_deploy_ratio)
	if RAT_ON ~= RAT_ON_last then
		rat_moving = true
	end	

	if rat_moving and RAT_ON == 6 then
		if RAT_deploy < 1 then RAT_deploy = RAT_deploy + passed
		else RAT_deploy = 1 
			rat_moving = false end
		set(rat_deploy_ratio, RAT_deploy)
	elseif rat_moving and RAT_ON ~= 6 then
		if RAT_deploy > 0 then RAT_deploy = RAT_deploy - passed * 0.1
		else RAT_deploy = 0 
		rat_moving = false end
		set(rat_deploy_ratio, RAT_deploy)	
	end
	RAT_ON_last = RAT_ON
	
	-- RAT rotation
	local RAT_rpm = 0
	if RAT_deploy == 1 then RAT_rpm = get(airspeed) * 5 end
	set(rat_RPM, RAT_rpm)
	
	
	if RAT_deploy == 1 then RAT_angle = RAT_angle + RAT_rpm * passed * 6
	else RAT_angle = 0 end
	set(rat_angle, RAT_angle)
	
	
	
	

end