-- this is the animation calculations

-- enviroment
defineProperty("frame_time", globalPropertyf("sim/custom/xap/time/frame_time")) -- frame time
defineProperty("airspeed", globalPropertyf("sim/cockpit2/gauges/indicators/airspeed_kts_pilot"))
defineProperty("machno", globalPropertyf("sim/flightmodel/misc/machno"))
defineProperty("ground_spd", globalPropertyf("sim/flightmodel/position/groundspeed"))
defineProperty("overr", globalPropertyf("sim/operation/override/override_control_surfaces")) -- override controls

defineProperty("gear2_deflect", globalPropertyf("sim/flightmodel2/gear/tire_vertical_deflection_mtr[1]"))  -- vertical deflection of left gear
defineProperty("gear3_deflect", globalPropertyf("sim/flightmodel2/gear/tire_vertical_deflection_mtr[2]"))  -- vertical deflection of right gear

createProp("sim/custom/xap/controls/speed_brake_lever", "float", 0); -- position of throttle reverse lever

defineProperty("speed_brake_lever", globalPropertyf("sim/custom/xap/controls/speed_brake_lever")) -- position of throttle lever


--[[

--]]

-- controls
defineProperty("head_ratio", globalPropertyf("sim/flightmodel2/controls/heading_ratio"))
defineProperty("pitch_ratio", globalPropertyf("sim/flightmodel2/controls/pitch_ratio"))
defineProperty("roll_ratio", globalPropertyf("sim/flightmodel2/controls/roll_ratio"))
defineProperty("sb_ratio", globalPropertyf("sim/cockpit2/controls/speedbrake_ratio"))
defineProperty("flap_ratio", globalPropertyf("sim/cockpit2/controls/flap_ratio"))

defineProperty("elevator_trim", globalPropertyf("sim/cockpit2/controls/elevator_trim")) -- sim pitch trimmer
defineProperty("aileron_trim", globalPropertyf("sim/cockpit2/controls/aileron_trim")) -- sim roll trimmer
defineProperty("rudder_trim", globalPropertyf("sim/cockpit2/controls/rudder_trim")) -- sim yaw trimmer

defineProperty("tro_lever_L", globalPropertyf("sim/custom/xap/throttle/tro_lever_L")) -- position of throttle lever
defineProperty("tro_lever_R", globalPropertyf("sim/custom/xap/throttle/tro_lever_R")) -- position of throttle lever
defineProperty("tro_rev_lever_L", globalPropertyf("sim/custom/xap/throttle/tro_rev_lever_L")) -- position of throttle lever
defineProperty("tro_rev_lever_R", globalPropertyf("sim/custom/xap/throttle/tro_rev_lever_R")) -- position of throttle lever

-- wings
defineProperty("ail_set_inn_L", globalPropertyf("sim/flightmodel2/wing/aileron1_deg[2]")) -- inner aileron left Degrees, positive is trailing-edge down.
defineProperty("ail_set_inn_R", globalPropertyf("sim/flightmodel2/wing/aileron1_deg[3]")) -- inner aileron right Degrees, positive is trailing-edge down.
defineProperty("ail_set_out_L", globalPropertyf("sim/flightmodel2/wing/aileron2_deg[6]")) -- outer aileron left Degrees, positive is trailing-edge down.
defineProperty("ail_set_out_R", globalPropertyf("sim/flightmodel2/wing/aileron2_deg[7]")) -- outer aileron right Degrees, positive is trailing-edge down.

defineProperty("spoiler_inn_L", globalPropertyf("sim/flightmodel2/wing/spoiler1_deg[0]")) -- inner spoilers left
defineProperty("spoiler_inn_R", globalPropertyf("sim/flightmodel2/wing/spoiler1_deg[1]")) -- inner spoilers right
defineProperty("spoiler_out_L", globalPropertyf("sim/flightmodel2/wing/spoiler2_deg[4]")) -- outer spoilers left
defineProperty("spoiler_out_R", globalPropertyf("sim/flightmodel2/wing/spoiler2_deg[5]")) -- outer spoilers right

defineProperty("flap_inn_L", globalPropertyf("sim/flightmodel2/wing/flap1_deg[0]")) -- inner flaps left
defineProperty("flap_inn_R", globalPropertyf("sim/flightmodel2/wing/flap1_deg[1]")) -- inner flaps right
defineProperty("flap_out_L", globalPropertyf("sim/flightmodel2/wing/flap2_deg[4]")) -- outer flaps left
defineProperty("flap_out_R", globalPropertyf("sim/flightmodel2/wing/flap2_deg[5]")) -- outer flaps right

defineProperty("sim_flap_time", globalPropertyf("sim/aircraft/controls/acf_flap_deftime")) -- time to make flaps full cycle

-- defineProperty("sl1_ratio", globalPropertyf("sim/flightmodel2/controls/slat1_deploy_ratio")) -- inner slats
-- defineProperty("sl2_ratio", globalPropertyf("sim/flightmodel2/controls/slat2_deploy_ratio")) -- outer slats
-- can't control the slats directly. use flap_ratio to manipulate them and set the proper time for flaps

-- tail
defineProperty("elevator_L", globalPropertyf("sim/flightmodel2/wing/elevator1_deg[8]")) -- Degrees, positive is trailing-edge down.
defineProperty("elevator_R", globalPropertyf("sim/flightmodel2/wing/elevator1_deg[9]")) -- Degrees, positive is trailing-edge down.
defineProperty("rudder", globalPropertyf("sim/flightmodel2/wing/rudder1_deg[10]"))


-- animations
createProp("sim/custom/xap/wings/spoiler1", "float", 0); -- spoiler 1 position. count from left wing's tip to the right.
createProp("sim/custom/xap/wings/spoiler2", "float", 0); -- spoiler 2 position.
createProp("sim/custom/xap/wings/spoiler3", "float", 0); -- spoiler 3 position.
createProp("sim/custom/xap/wings/spoiler4", "float", 0); -- spoiler 4 position.
createProp("sim/custom/xap/wings/spoiler5", "float", 0); -- spoiler 5 position.
createProp("sim/custom/xap/wings/spoiler6", "float", 0); -- spoiler 6 position.
createProp("sim/custom/xap/wings/spoiler7", "float", 0); -- spoiler 7 position.
createProp("sim/custom/xap/wings/spoiler8", "float", 0); -- spoiler 8 position.
createProp("sim/custom/xap/wings/spoiler9", "float", 0); -- spoiler 9 position.
createProp("sim/custom/xap/wings/spoiler10", "float", 0); -- spoiler 10 position.
createProp("sim/custom/xap/wings/spoiler11", "float", 0); -- spoiler 11 position.
createProp("sim/custom/xap/wings/spoiler12", "float", 0); -- spoiler 12 position.
defineProperty("spoiler1", globalPropertyf("sim/custom/xap/wings/spoiler1")) -- spoiler 1 position
defineProperty("spoiler2", globalPropertyf("sim/custom/xap/wings/spoiler2")) -- spoiler 1 position
defineProperty("spoiler3", globalPropertyf("sim/custom/xap/wings/spoiler3")) -- spoiler 1 position
defineProperty("spoiler4", globalPropertyf("sim/custom/xap/wings/spoiler4")) -- spoiler 1 position
defineProperty("spoiler5", globalPropertyf("sim/custom/xap/wings/spoiler5")) -- spoiler 1 position
defineProperty("spoiler6", globalPropertyf("sim/custom/xap/wings/spoiler6")) -- spoiler 1 position
defineProperty("spoiler7", globalPropertyf("sim/custom/xap/wings/spoiler7")) -- spoiler 1 position
defineProperty("spoiler8", globalPropertyf("sim/custom/xap/wings/spoiler8")) -- spoiler 1 position
defineProperty("spoiler9", globalPropertyf("sim/custom/xap/wings/spoiler9")) -- spoiler 1 position
defineProperty("spoiler10", globalPropertyf("sim/custom/xap/wings/spoiler10")) -- spoiler 1 position
defineProperty("spoiler11", globalPropertyf("sim/custom/xap/wings/spoiler11")) -- spoiler 1 position
defineProperty("spoiler12", globalPropertyf("sim/custom/xap/wings/spoiler12")) -- spoiler 1 position

set(overr, 0)

-- interpolate values using table as reference
local function interpolate(tbl, value)
    local lastActual = 0
    local lastReference = 0
    for _k, v in pairs(tbl) do
        if value == v[1] then
            return v[2]
        end
        if value < v[1] then
            local a = value - lastActual
            local m = v[2] - lastReference
            return lastReference + a / (v[1] - lastActual) * m
        end
        lastActual = v[1]
        lastReference = v[2]
    end
    return value - lastActual + lastReference
end

local function flap_speed(pos, inn) -- flap speed deg/sec
	local speed = 0.0000001 -- prevent dividing by 0
	if inn then -- for inboard flap
		if pos < 5 then speed = 0.3
		elseif pos < 13 then speed = 0.7
		elseif pos < 20 then speed = 2.41
		elseif pos < 25 then speed = 2.08
		elseif pos < 35 then speed = 2.38
		else speed = 1.94 end
	else -- for outboard flap
		if pos < 5 then speed = 0.3
		elseif pos < 13 then speed = 0.7
		elseif pos < 21 then speed = 2.83
		elseif pos < 26.5 then speed = 2.29
		elseif pos < 36.7 then speed = 2.43
		else speed = 1.52 end	
	end
	return speed	
end

local flap_to_ail = {{ -50, 0 }, -- flaps UP
					{ 1, 0 }, -- 1 units. only slats goes down
					{ 13, 10 }, -- 5 units
					{35, 10}, -- 25 units
					{41, 5 }, -- 30 units
				  {100, 5}} -- extended limits

				  
local wheel_to_SP_noflaps = 
					{{ 0, 0 }, -- wheel at zero
					{ 8, 0 }, -- 
					{ 32, 0.222 }, --
					{63, 1}, -- 
				  {100, 1}} -- extended limits

				  
local wheel_to_SP_flaps = 
					{{ 0, 0 }, -- wheel at zero
					{ 4, 0 }, -- 
					{ 45, 0.25 }, --
					{63, 1}, -- 
				  {100, 1}} -- extended limits

local rudder_ratio = 
					{{ -999999, 26.5 }, -- extend limits
					{ 140, 26.5 }, -- IAS
					{ 200, 13 }, -- this poiunt may be corrected
					{ 280, 8 }, -- this poiunt may be corrected
					{440, 2.05}, -- max limit
					{9999999, 1}} -- extended limits



				  

local hydro_L = 1 -- this variables will be extended later
local hydro_C = 1
local hydro_R = 1
				  
local ail_coef = 1 -- outboard aileron coefficient. it goes to 0 at high speeds.
local out_ail_actual_L = 0
local out_ail_actual_R = 0
local inn_ail_actual_L = 0
local inn_ail_actual_R = 0
local inn_ail_drop_L = 0
local inn_ail_drop_R = 0

local spoiler_actual_1 = 0
local spoiler_actual_2 = 0
local spoiler_actual_3 = 0
local spoiler_actual_4 = 0
local spoiler_actual_5 = 0
local spoiler_actual_6 = 0
local spoiler_actual_7 = 0
local spoiler_actual_8 = 0
local spoiler_actual_9 = 0
local spoiler_actual_10 = 0
local spoiler_actual_11 = 0
local spoiler_actual_12 = 0

local elevator_actual = 0
local elevator_drop = 0

local rudder_actual = 0
local wasAutoSB = false
local wasAutoRet = false
local sync_counter = 0


function update()
	-- initialise
	set(overr, 1)
	local passed = get(frame_time)

	local IAS = get(airspeed)
	local mach = get(machno)

	hydro_L = 1 -- this variables will be extended later
	hydro_C = 1
	hydro_R = 1
	
	
	-- ailerons
	-- controll wheel rotates up to 65 deg each direction
	-- set main control for ailerons
	local roll_wheel = get(roll_ratio) * 65 + get(aileron_trim) * 30 -- convert wheel ratio to degrees, add trimmers
	
	-- outboard ailerons goes from 15.5 deg down to 30.5 deg up on 50 deg of wheel. positive deg - trailing edge down
	-- outboard ailerons are blocks, when airspeed of mach number is too high.
	
	if IAS > 275 or mach > 0.58 or (IAS > 235 and mach > 0.5) and ail_coef > 0 then ail_coef = ail_coef - passed * 0.067
	elseif ail_coef < 1 then ail_coef = ail_coef + passed * 0.067 end
	
	if ail_coef < 0 then ail_coef = 0
	elseif ail_coef > 1 then ail_coef = 1 end
	
	
	local left_out_ail_deg = 0
	local right_out_ail_deg = 0
	if roll_wheel > 0.001 then -- roll right
		left_out_ail_deg = math.min(roll_wheel * ail_coef * 0.31, 15.5) * (hydro_L + hydro_R) * 0.5
		right_out_ail_deg = -math.min(roll_wheel * ail_coef * 0.61, 30.5) * (hydro_L + hydro_R) * 0.5
	elseif roll_wheel < -0.001 then -- roll left
		right_out_ail_deg = -math.max(roll_wheel * ail_coef * 0.31, -15.5) * (hydro_L + hydro_R) * 0.5
		left_out_ail_deg = math.max(roll_wheel * ail_coef * 0.61, -30.5) * (hydro_L + hydro_R) * 0.5
	else
		left_out_ail_deg = 0
		right_out_ail_deg = 0
	end
	
	-- add hydraulics and smooth movements
	out_ail_actual_L = out_ail_actual_L + (left_out_ail_deg - out_ail_actual_L) * passed * 4 * (hydro_L + hydro_R) * 0.5
	out_ail_actual_R = out_ail_actual_R + (right_out_ail_deg - out_ail_actual_R) * passed * 4 * (hydro_L + hydro_R) * 0.5

	-- set results
	set(ail_set_out_L, out_ail_actual_L)
	set(ail_set_out_R, out_ail_actual_R)	
	
	-- inboard ailerons goes from 21.5 deg down to 21.5 deg up on 32 deg of wheel. positive deg - trailing edge down
	-- inboard ailerons goes down 10 deg when flaps are down (see table above)
	-- drop down ailerons when hydraulic pressure is too low
	if hydro_L + hydro_C < 0.3 and inn_ail_drop_L < 50 then inn_ail_drop_L = inn_ail_drop_L + passed * 0.002
	elseif hydro_L + hydro_C >= 0.3 and inn_ail_drop_L > 0 then inn_ail_drop_L = inn_ail_drop_L - passed * 0.1
	end
	inn_ail_drop_L = inn_ail_drop_L * (1 - math.min(0, math.max(1, IAS * 0.01)))
	
	if hydro_R + hydro_C < 0.3 and inn_ail_drop_R < 50 then inn_ail_drop_R = inn_ail_drop_R + passed * 0.002 
	elseif hydro_R + hydro_C >= 0.3 and inn_ail_drop_R > 0 then inn_ail_drop_R = inn_ail_drop_R - passed * 0.1 
	end
	inn_ail_drop_R = inn_ail_drop_R * (1 - math.min(0, math.max(1, IAS * 0.01)))
	
	local left_inn_ail_deg = roll_wheel * 0.671875 + interpolate(flap_to_ail, get(flap_inn_L)) * (hydro_L + hydro_C) * 0.5
	local right_inn_ail_deg = -roll_wheel * 0.671875 + interpolate(flap_to_ail, get(flap_inn_R)) * (hydro_R + hydro_C) * 0.5
	
	if left_inn_ail_deg > 21.5 then left_inn_ail_deg = 21.5
	elseif left_inn_ail_deg < -21.5 then left_inn_ail_deg = -21.5 end
	if right_inn_ail_deg > 21.5 then right_inn_ail_deg = 21.5
	elseif right_inn_ail_deg < -21.5 then right_inn_ail_deg = -21.5 end

	-- add hydraulics and smooth movements
	inn_ail_actual_L = inn_ail_actual_L + (left_inn_ail_deg - inn_ail_actual_L) * passed * 4 * (hydro_L + hydro_C) * 0.5 + inn_ail_drop_L
	inn_ail_actual_R = inn_ail_actual_R + (right_inn_ail_deg - inn_ail_actual_R) * passed * 4 * (hydro_C + hydro_R) * 0.5 + inn_ail_drop_R
	
	-- limit inn ailerons movement
	if inn_ail_actual_L > 21.5 then inn_ail_actual_L = 21.5
	elseif inn_ail_actual_L < -21.5 then inn_ail_actual_L = -21.5 end
	if inn_ail_actual_R > 21.5 then inn_ail_actual_R = 21.5
	elseif inn_ail_actual_R < -21.5 then inn_ail_actual_R = -21.5 end
	
	-- set results
	set(ail_set_inn_L, inn_ail_actual_L)
	set(ail_set_inn_R, inn_ail_actual_R)


	-- spoilers
	-- spoilers can work as additional roll surfaces and as speedbrakes
	
	local inn_sp_comm_L = 0 -- degrees to rise panels
	local inn_sp_comm_R = 0
	local out_sp_comm_L = 0
	local out_sp_comm_R = 0

	-- speedbrakes are limited in flight to 45 deg for outboard and 17 deg for inboard panels.
	-- panels 4 and 9 do not react on SB lever in flight
	-- panels 4, 5, 8, 9 locks out with outboard ailerons
	-- also speedbrakes depends on flaps position, changing their travel positions from control wheel
	-- on ground speedbrake handle rises all panels to 64 deg

	-- detect ground
	local OnGround = get(gear2_deflect) > 0.05 or get(gear3_deflect) > 0.05
	
	local s_brakes = get(speed_brake_lever) -- this variable must be custom with custom logic
	

	
	-- autospeedbrake logic
	-- autoextend in two cases: 
	-- 1 - airplane is on ground, SB lever in ARM position, throttles in IDLE position
	-- 2 - airplane is on ground, SB lever in OFF position, throttles in REVERS position
	
	-- autoretract when: airplane is on ground, SB in full position after auto extend, throttles forward.


	if OnGround then
		if s_brakes < 0.3 and s_brakes > 0.1 and get(tro_lever_L) + get(tro_lever_R) < 0.3 and not wasAutoSB then 
			set(speed_brake_lever, 1) 
			wasAutoSB = true 
			set(sb_ratio, 1) 
			sync_counter = 0
			s_brakes = 1
		elseif s_brakes <= 0.1 and get(tro_rev_lever_L) + get(tro_rev_lever_R) > 0.4 and not wasAutoSB then 
			set(speed_brake_lever, 1) 
			wasAutoSB = true 
			set(sb_ratio, 1) 
			sync_counter = 0
			s_brakes = 1
		elseif s_brakes == 1 and get(tro_lever_L) + get(tro_lever_R) >= 0.3 and wasAutoSB then 
			set(speed_brake_lever, 0) 
			set(sb_ratio, 0) 
			sync_counter = 0 
			wasAutoRet = true 
			wasAutoSB = false
			s_brakes = 0
		end
	end
	if s_brakes < 0.05 then wasAutoSB = false end
	
	-- sync custom and sim positions
	sync_counter = sync_counter + passed
	if sync_counter > 2 then
		--sync_counter = 0
		set(speed_brake_lever, get(sb_ratio))
		wasAutoRet = false
	--elseif wasAutoSB then set(sb_ratio, 1)
	elseif wasAutoRet then set(sb_ratio, 0)
	end

	s_brakes = math.max(0, s_brakes - 0.3) * 1.429 
	
	
	
	if OnGround or wasAutoSB then -- on ground operations
		if roll_wheel >= 0 then -- roll right
			if get(flap_inn_L) < 35 then -- no flaps
				inn_sp_comm_L = math.max(s_brakes * 64 - interpolate(wheel_to_SP_noflaps, roll_wheel) * 17, 0)
				out_sp_comm_L = math.max(s_brakes * 64 - interpolate(wheel_to_SP_noflaps, roll_wheel) * 45, 0)
			else
				inn_sp_comm_L = math.max(s_brakes * 64 - interpolate(wheel_to_SP_flaps, roll_wheel) * 17, 0)
				out_sp_comm_L = math.max(s_brakes * 64 - interpolate(wheel_to_SP_flaps, roll_wheel) * 45, 0)
			end
			if get(flap_inn_R) < 35 then -- no flaps
				inn_sp_comm_R = math.min(s_brakes * 64 + interpolate(wheel_to_SP_noflaps, roll_wheel) * 17, 64)
				out_sp_comm_R = math.min(s_brakes * 64 + interpolate(wheel_to_SP_noflaps, roll_wheel) * 45, 64)
			else
				inn_sp_comm_R = math.min(s_brakes * 64 + interpolate(wheel_to_SP_flaps, roll_wheel) * 17, 64)
				out_sp_comm_R = math.min(s_brakes * 64 + interpolate(wheel_to_SP_flaps, roll_wheel) * 45, 64)		
			end			
		else 
			if get(flap_inn_L) < 35 then -- no flaps
				inn_sp_comm_L = math.min(s_brakes * 64 + interpolate(wheel_to_SP_noflaps, -roll_wheel) * 17, 64)
				out_sp_comm_L = math.min(s_brakes * 64 + interpolate(wheel_to_SP_noflaps, -roll_wheel) * 45, 64)
			else
				inn_sp_comm_L = math.min(s_brakes * 64 + interpolate(wheel_to_SP_flaps, -roll_wheel) * 17, 64)
				out_sp_comm_L = math.min(s_brakes * 64 + interpolate(wheel_to_SP_flaps, -roll_wheel) * 45, 64)
			end
			if get(flap_inn_R) < 35 then -- no flaps
				inn_sp_comm_R = math.max(s_brakes * 64 - interpolate(wheel_to_SP_noflaps, -roll_wheel) * 17, 0)
				out_sp_comm_R = math.max(s_brakes * 64 - interpolate(wheel_to_SP_noflaps, -roll_wheel) * 45, 0)
			else
				inn_sp_comm_R = math.max(s_brakes * 64 - interpolate(wheel_to_SP_flaps, -roll_wheel) * 17, 0)
				out_sp_comm_R = math.max(s_brakes * 64 - interpolate(wheel_to_SP_flaps, -roll_wheel) * 45, 0)	
			end
		end
	
	else -- on flight operations
		if roll_wheel >= 0 then -- roll right
			if get(flap_inn_L) < 35 then -- no flaps
				inn_sp_comm_L = math.max(s_brakes * 17 - interpolate(wheel_to_SP_noflaps, roll_wheel) * 17, 0)
				out_sp_comm_L = math.max(s_brakes * 45 - interpolate(wheel_to_SP_noflaps, roll_wheel) * 45, 0)
			else
				inn_sp_comm_L = math.max(s_brakes * 17 - interpolate(wheel_to_SP_flaps, roll_wheel) * 17, 0)
				out_sp_comm_L = math.max(s_brakes * 45 - interpolate(wheel_to_SP_flaps, roll_wheel) * 45, 0)
			end
			if get(flap_inn_R) < 35 then -- no flaps
				inn_sp_comm_R = math.min(s_brakes * 17 + interpolate(wheel_to_SP_noflaps, roll_wheel) * 17, 17)
				out_sp_comm_R = math.min(s_brakes * 45 + interpolate(wheel_to_SP_noflaps, roll_wheel) * 45, 45)
			else
				inn_sp_comm_R = math.min(s_brakes * 17 + interpolate(wheel_to_SP_flaps, roll_wheel) * 17, 17)
				out_sp_comm_R = math.min(s_brakes * 45 + interpolate(wheel_to_SP_flaps, roll_wheel) * 45, 45)
			end			
		else
			if get(flap_inn_L) < 35 then -- no flaps
				inn_sp_comm_L = math.min(s_brakes * 17 + interpolate(wheel_to_SP_noflaps, -roll_wheel) * 17, 17)
				out_sp_comm_L = math.min(s_brakes * 45 + interpolate(wheel_to_SP_noflaps, -roll_wheel) * 45, 45)
			else
				inn_sp_comm_L = math.min(s_brakes * 17 + interpolate(wheel_to_SP_flaps, -roll_wheel) * 17, 17)
				out_sp_comm_L = math.min(s_brakes * 45 + interpolate(wheel_to_SP_flaps, -roll_wheel) * 45, 45)
			end
			if get(flap_inn_R) < 35 then -- no flaps
				inn_sp_comm_R = math.max(s_brakes * 17 - interpolate(wheel_to_SP_noflaps, -roll_wheel) * 17, 0)
				out_sp_comm_R = math.max(s_brakes * 45 - interpolate(wheel_to_SP_noflaps, -roll_wheel) * 45, 0)
			else
				inn_sp_comm_R = math.max(s_brakes * 17 - interpolate(wheel_to_SP_flaps, -roll_wheel) * 17, 0)
				out_sp_comm_R = math.max(s_brakes * 45 - interpolate(wheel_to_SP_flaps, -roll_wheel) * 45, 0)
			end
		end		

	end
	
	-- set actual position for spoilers. add hydraulics here
		spoiler_actual_1 = spoiler_actual_1 + (out_sp_comm_L * hydro_L - spoiler_actual_1) * passed * 4 * hydro_L
		spoiler_actual_2 = spoiler_actual_2 + (out_sp_comm_L * hydro_R - spoiler_actual_2) * passed * 4 * hydro_R
		spoiler_actual_3 = spoiler_actual_3 + (out_sp_comm_L * hydro_C - spoiler_actual_3) * passed * 4 * hydro_C
		--spoiler_actual_5 = spoiler_actual_5 + (inn_sp_comm_L * hydro_C - spoiler_actual_5) * passed * 5 * hydro_C
		spoiler_actual_6 = spoiler_actual_6 + (inn_sp_comm_L * hydro_L - spoiler_actual_6) * passed * 4 * hydro_L
		
		spoiler_actual_7 = spoiler_actual_7 + (inn_sp_comm_R * hydro_R - spoiler_actual_7) * passed * 4 * hydro_R
		--spoiler_actual_8 = spoiler_actual_8 + (inn_sp_comm_R * hydro_C - spoiler_actual_8) * passed * 5 * hydro_C			
		spoiler_actual_10 = spoiler_actual_10 + (out_sp_comm_R * hydro_C - spoiler_actual_10) * passed * 4 * hydro_C
		spoiler_actual_11 = spoiler_actual_11 + (out_sp_comm_R * hydro_R - spoiler_actual_11) * passed * 4 * hydro_R
		spoiler_actual_12 = spoiler_actual_12 + (out_sp_comm_R * hydro_L - spoiler_actual_12) * passed * 4 * hydro_L

	if OnGround or wasAutoSB then -- on ground operations
		spoiler_actual_4 = spoiler_actual_4 + (out_sp_comm_L * hydro_C - spoiler_actual_4)  * passed * 4 * hydro_C
		spoiler_actual_9 = spoiler_actual_9 + (out_sp_comm_R * hydro_C - spoiler_actual_9) * passed * 4 * hydro_C

		if get(flap_inn_L) < 35 then -- no flaps
			if roll_wheel >= 0 then -- roll right
				spoiler_actual_5 = spoiler_actual_5 + (math.max(s_brakes * 64 - interpolate(wheel_to_SP_noflaps, roll_wheel * ail_coef) * 17, 0) * hydro_C - spoiler_actual_5) * passed * 4 * hydro_C
			else
				spoiler_actual_5 = spoiler_actual_5 + (math.min(s_brakes * 64 + interpolate(wheel_to_SP_noflaps, -roll_wheel * ail_coef) * 17, 64) * hydro_C - spoiler_actual_5) * passed * 4 * hydro_C
			end
		else
			if roll_wheel >= 0 then -- roll right
				spoiler_actual_5 = spoiler_actual_5 + (math.max(s_brakes * 64 - interpolate(wheel_to_SP_flaps, roll_wheel * ail_coef) * 17, 0) * hydro_C - spoiler_actual_5) * passed * 4 * hydro_C
			else
				spoiler_actual_5 = spoiler_actual_5 + (math.min(s_brakes * 64 + interpolate(wheel_to_SP_flaps, -roll_wheel * ail_coef) * 17, 64) * hydro_C - spoiler_actual_5) * passed * 4 * hydro_C
			end
		end
		if get(flap_inn_R) < 35 then -- no flaps
			if roll_wheel <= 0 then -- roll right
				spoiler_actual_8 = spoiler_actual_8 + (math.max(s_brakes * 64 - interpolate(wheel_to_SP_noflaps, -roll_wheel * ail_coef) * 17, 0) * hydro_C - spoiler_actual_8) * passed * 4 * hydro_C
			else
				spoiler_actual_8 = spoiler_actual_8 + (math.min(s_brakes * 64 + interpolate(wheel_to_SP_noflaps, roll_wheel * ail_coef) * 17, 64) * hydro_C - spoiler_actual_8) * passed * 4 * hydro_C
			end
		else
			if roll_wheel <= 0 then -- roll right
				spoiler_actual_8 = spoiler_actual_8 + (math.max(s_brakes * 64 - interpolate(wheel_to_SP_flaps, -roll_wheel * ail_coef) * 17, 0) * hydro_C - spoiler_actual_8) * passed * 4 * hydro_C
			else
				spoiler_actual_8 = spoiler_actual_8 + (math.min(s_brakes * 64 + interpolate(wheel_to_SP_flaps, roll_wheel * ail_coef) * 17, 64) * hydro_C - spoiler_actual_8) * passed * 4 * hydro_C
			end
		end
		
	else
		if get(flap_inn_L) < 35 then -- no flaps
			if roll_wheel >= 0 then -- roll right
				spoiler_actual_4 = spoiler_actual_4 + (0 - spoiler_actual_4) * passed * 4 * hydro_C
				spoiler_actual_5 = spoiler_actual_5 + (math.max(s_brakes * 17 - interpolate(wheel_to_SP_noflaps, roll_wheel * ail_coef) * 17, 0) * hydro_C - spoiler_actual_5) * passed * 4 * hydro_C
			else
				spoiler_actual_4 = spoiler_actual_4 + (interpolate(wheel_to_SP_noflaps, -roll_wheel) * 45 * hydro_C * ail_coef - spoiler_actual_4) * passed * 4 * hydro_C
				spoiler_actual_5 = spoiler_actual_5 + (math.min(s_brakes * 17 + interpolate(wheel_to_SP_noflaps, -roll_wheel * ail_coef) * 17, 17) * hydro_C - spoiler_actual_5) * passed * 4 * hydro_C
			end
		else
			if roll_wheel >= 0 then -- roll right
				spoiler_actual_4 = spoiler_actual_4 + (0 - spoiler_actual_4) * passed * 4 * hydro_C
				spoiler_actual_5 = spoiler_actual_5 + (math.max(s_brakes * 17 - interpolate(wheel_to_SP_flaps, roll_wheel * ail_coef) * 17, 0) * hydro_C - spoiler_actual_5) * passed * 4 * hydro_C
			else
				spoiler_actual_4 = spoiler_actual_4 + (interpolate(wheel_to_SP_flaps, -roll_wheel) * 45 * hydro_C * ail_coef - spoiler_actual_4) * passed * 4 * hydro_C
				spoiler_actual_5 = spoiler_actual_5 + (math.min(s_brakes * 17 + interpolate(wheel_to_SP_flaps, -roll_wheel * ail_coef) * 17, 17) * hydro_C - spoiler_actual_5) * passed * 4 * hydro_C
			end
		end
		if get(flap_inn_R) < 35 then -- no flaps
			if roll_wheel <= 0 then -- roll right
				spoiler_actual_8 = spoiler_actual_8 + (math.max(s_brakes * 17 - interpolate(wheel_to_SP_noflaps, -roll_wheel * ail_coef) * 17, 0) * hydro_C - spoiler_actual_8) * passed * 4 * hydro_C
				spoiler_actual_9 = spoiler_actual_9 + (0 - spoiler_actual_9) * passed * 4 * hydro_C
			else
				spoiler_actual_8 = spoiler_actual_8 + (math.min(s_brakes * 17 + interpolate(wheel_to_SP_noflaps, roll_wheel * ail_coef) * 17, 17) * hydro_C - spoiler_actual_8) * passed * 4 * hydro_C
				spoiler_actual_9 = spoiler_actual_9 + (interpolate(wheel_to_SP_noflaps, roll_wheel) * 45 * hydro_C * ail_coef - spoiler_actual_9) * passed * 4 * hydro_C
			end
		else
			if roll_wheel <= 0 then -- roll right
				spoiler_actual_8 = spoiler_actual_8 + (math.max(s_brakes * 17 - interpolate(wheel_to_SP_flaps, -roll_wheel * ail_coef) * 17, 0) * hydro_C - spoiler_actual_8) * passed * 4 * hydro_C
				spoiler_actual_9 = spoiler_actual_9 + (0 - spoiler_actual_9) * passed * 4 * hydro_C
			else
				spoiler_actual_8 = spoiler_actual_8 + (math.min(s_brakes * 17 + interpolate(wheel_to_SP_flaps, roll_wheel * ail_coef) * 17, 17) * hydro_C - spoiler_actual_8) * passed * 4 * hydro_C
				spoiler_actual_9 = spoiler_actual_9 + (interpolate(wheel_to_SP_flaps, roll_wheel) * 45 * hydro_C * ail_coef - spoiler_actual_9) * passed * 4 * hydro_C
			end
		end
	
		
	end
	
	-- set results 
	set(spoiler_inn_L, (spoiler_actual_5 + spoiler_actual_6) * 0.5)
	set(spoiler_inn_R, (spoiler_actual_7 + spoiler_actual_8) * 0.5)
	set(spoiler_out_L, (spoiler_actual_1 + spoiler_actual_2 + spoiler_actual_3 + spoiler_actual_4) * 0.25)
	set(spoiler_out_R, (spoiler_actual_9 + spoiler_actual_10 + spoiler_actual_11 + spoiler_actual_12) * 0.25)

	-- set animations
	set(spoiler1, spoiler_actual_1)
	set(spoiler2, spoiler_actual_2)
	set(spoiler3, spoiler_actual_3)
	set(spoiler4, spoiler_actual_4)
	set(spoiler5, spoiler_actual_5)
	set(spoiler6, spoiler_actual_6)
	set(spoiler7, spoiler_actual_7)
	set(spoiler8, spoiler_actual_8)
	set(spoiler9, spoiler_actual_9)
	set(spoiler10, spoiler_actual_10)
	set(spoiler11, spoiler_actual_11)
	set(spoiler12, spoiler_actual_12)

	
	
	-- elevator control
	-- elevator moves in range from 20.5 deg down to 28.5 deg up.
	-- stab trimm moves in range +2 deg (0 units) to -12.2 deg (14.2 units)
	-- when stab trimm is more than 8.5 units - elevator moves up to 4.75 deg at 14.5 units.
	-- stab trimm changes pitch at 0.5 deg/sec below 167 kts IAS and 0.2 deg/sec above 198 kt IAS.
	-- sim stab trimm work from -0.16 to +1

	local pitch_comm = get(pitch_ratio) -- commanded pitch	
	local elevator_deg = 0
	-- math.abs(pitch_comm)^(1 + IAS / 100)
	if pitch_comm < -0.001 then elevator_deg = (math.abs(pitch_comm) ^ (1 + math.max(0, IAS - 150) / 100)) * 20.5 * (hydro_L + hydro_C + hydro_R) / 3
	elseif pitch_comm > 0.001 then elevator_deg = -(math.abs(pitch_comm) ^ (1 + math.max(0, IAS - 150) / 100)) * 28.5 * (hydro_L + hydro_C + hydro_R) / 3 
	else elevator_deg = 0
	end

	if hydro_L + hydro_C + hydro_R < 0.4 and elevator_drop < 50 then elevator_drop = elevator_drop + passed * 0.002
	elseif hydro_L + hydro_C + hydro_R >= 0.4 and elevator_drop > 0 then elevator_drop = elevator_drop - passed * 0.1
	end
	elevator_drop = elevator_drop * (1 - math.min(0, math.max(1, IAS * 0.01)))

	-- add elevator rise depending on stab trimm
	local stab_trimm = get(elevator_trim) * 12.24 + 2 -- recalculate stab trimm to units
	elevator_deg = elevator_deg - (math.max(0, stab_trimm - 8.5) * 0.9)

	-- smooth move and add hydraulic
	elevator_actual = elevator_actual + (elevator_deg - elevator_actual) * passed * (hydro_L + hydro_C + hydro_R) * 1.3 + elevator_drop
	
	-- set limits
	if elevator_actual > 20.5 then elevator_actual = 20.5
	elseif elevator_actual < -28.5 then elevator_actual = -28.5 end
	
	--set(elevator_trim, 0)
	set(elevator_L, elevator_actual)
	set(elevator_R, elevator_actual)



	
	
	-- rudder control
	-- full travel of rudder is 26.5 deg below 150 kt IAS and 2.05 deg at 420 kt IAS
	-- rudder trimm can rotate it up to 16.8 deg at low speed and up to 2.6 deg at speed more than 360 kt IAS
	-- autopilot is limited to 23 deg
	-- ATA page 339

	local yaw_comm = get(head_ratio) -- commaded yaw
	local yav_deg = yaw_comm * interpolate(rudder_ratio, IAS) * (hydro_L + hydro_C + hydro_R) / 3 + get(rudder_trim) * (16.8 - math.min(math.abs(IAS) * 0.03944, 14.2))

	-- set limits
	if yav_deg > 26.5 then yav_deg = 26.5
	elseif yav_deg < -26.5 then yav_deg = -26.5 end
	
	-- smooth moves and add hydraulics speed
	rudder_actual = rudder_actual + (yav_deg - rudder_actual) * passed * (hydro_L + hydro_C + hydro_R) * 1.5
	
	set(rudder, rudder_actual)
	


	
	

end

function onAvionicsDone()
	set(overr, 0)
	print("flight controls released")
end



-- move speedbrakes lever UP
SB_UP_comm = findCommand("sim/flight_controls/speed_brakes_down_one") -- button 4
function SB_UP_hnd(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if 0 == phase then
		local a = math.min(get(speed_brake_lever) + 0.2, 1)
		set(speed_brake_lever, a)
		set(sb_ratio, a)
    end
return 0
end
registerCommandHandler(SB_UP_comm, 0, SB_UP_hnd)

-- move speedbrakes lever DOWN
SB_DOWN_comm = findCommand("sim/flight_controls/speed_brakes_up_one") -- button 3
function SB_DOWN_hnd(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if 0 == phase then
		local a = math.max(get(speed_brake_lever) - 0.2, 0)
		set(speed_brake_lever, a)
		set(sb_ratio, a)		
    end
return 0
end
registerCommandHandler(SB_DOWN_comm, 0, SB_DOWN_hnd)








