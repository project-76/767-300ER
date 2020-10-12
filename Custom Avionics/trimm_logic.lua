-- this is trimmer logic

defineProperty("frame_time", globalPropertyf("sim/custom/xap/time/frame_time")) -- frame time
defineProperty("airspeed", globalPropertyf("sim/cockpit2/gauges/indicators/airspeed_kts_pilot"))
defineProperty("machno", globalPropertyf("sim/flightmodel/misc/machno"))
defineProperty("ground_spd", globalPropertyf("sim/flightmodel/position/groundspeed"))

defineProperty("elevator_trim", globalPropertyf("sim/cockpit2/controls/elevator_trim")) -- sim pitch trimmer
defineProperty("aileron_trim", globalPropertyf("sim/cockpit2/controls/aileron_trim")) -- sim roll trimmer
defineProperty("rudder_trim", globalPropertyf("sim/cockpit2/controls/rudder_trim")) -- sim yaw trimmer

createProp("1-sim/trimm/stabTrimmCommSwitchers", "int", 0); -- -1=nose down, 0=0, 1=nose up
defineProperty("stabTrimmSW", globalPropertyf("1-sim/trimm/stabTrimmCommSwitchers"))

createProp("1-sim/trimm/aileronTrimmCommSwitchers", "int", 0); -- -1=left roll, 0=0, 1=right roll
defineProperty("aileronTrimmSW", globalPropertyf("1-sim/trimm/aileronTrimmCommSwitchers"))

createProp("1-sim/trimm/ruddTrimmCommHandle", "float", 0); -- -1=nose left, 0=0, 1=nose right
defineProperty("ruddTrimmSW", globalPropertyf("1-sim/trimm/ruddTrimmCommHandle"))

--[[
stab trimm controls		1-sim/trimm/stabTrimmCommSwitchers	-1=nose down, 0=0, 1=nose up
stab trimm cut off left		1-sim/trimm/stabTrimmCutOffLeftSwitch	0=norm, 1=cut out
stab trimm cut off center		1-sim/trimm/stabTrimmCutOffCenterSwitch	0=norm, 1=cut out
stab trimm cut off left Cover		1-sim/trimm/stabTrimmCutOffLeftCover	
stab trimm cut off center Cover		1-sim/trimm/stabTrimmCutOffCenterCover	


ailerons trimmer switchers		1-sim/trimm/aileronTrimmCommSwitchers	-1=left roll, 0=0, 1=right roll
rudder trimmer controll wheel		1-sim/trimm/ruddTrimmCommHandle	-1=nose left, 0=0, 1=nose right
--]]


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

	-- stab trimm changes pitch at 0.5 deg/sec below 167 kts IAS and 0.2 deg/sec above 198 kt IAS.
	-- sim stab trimm work from -0.16 to +1
	-- stab uses left and center hydraulic systems

local ias_to_stabSpd = {{ -999999, 0.5 }, -- extend limits
					{ 167, 0.5 }, -- low speed
					{ 198, 0.2 }, -- high speed
					{9999999, 0.2}} -- extended limits


local H_stab_pos = get(elevator_trim)
local rud_trimm_pos = get(rudder_trim)
local ail_trimm_pos = get(aileron_trim)

local hydro_L = 1 -- this variables will be extended later
local hydro_C = 1
local hydro_R = 1


function update()
	
	local passed = get(frame_time)

	local IAS = get(airspeed)
	local mach = get(machno)

	hydro_L = 1 -- this variables will be extended later
	hydro_C = 1
	hydro_R = 1
	
	-- horizontal stab trimmers
	local stab_speed = interpolate(ias_to_stabSpd, IAS) * (hydro_L + hydro_C) * 0.5 / 14.2
	-- calculate new position
	H_stab_pos = H_stab_pos + get(stabTrimmSW) * stab_speed * passed
	-- set limits
	if H_stab_pos > 1 then H_stab_pos = 1
	elseif H_stab_pos < -0.16 then H_stab_pos = -0.16 end
	
	-- set results
	set(elevator_trim, H_stab_pos)
	
	
	-- aileron trimm
	-- aileron trimm goes 1 deg/sec of control wheel
	local ail_speed = (hydro_L + hydro_C + hydro_R) / (3 * 30)
	ail_trimm_pos = ail_trimm_pos + get(aileronTrimmSW) * passed * ail_speed
	
	-- set limits
	if ail_trimm_pos > 1 then ail_trimm_pos = 1
	elseif ail_trimm_pos < -1 then ail_trimm_pos = -1 end
	
	-- set results
	set(aileron_trim, ail_trimm_pos)
	
	
	
	
	
	-- rudder trimm
	-- rudder trimm can rotate it up to 16.8 deg at low speed and up to 2.6 deg at speed more than 360 kt IAS
	local rud_speed = (hydro_L + hydro_C + hydro_R) / (3 * 16.8)
	rud_trimm_pos = rud_trimm_pos + get(ruddTrimmSW) * passed * rud_speed
	-- set limits
	if rud_trimm_pos > 1 then rud_trimm_pos = 1
	elseif rud_trimm_pos < -1 then rud_trimm_pos = -1 end
	
	-- set result
	set(rudder_trim, rud_trimm_pos)
	
	
	
	
	
	
	
	
	
	
	
	
end



-- turn pitch trimmer UP
pitch_UP_comm = findCommand("sim/flight_controls/pitch_trim_up")
function pitch_UP_hnd(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if (1 == phase or 0 == phase) then
		set(stabTrimmSW, 1)
	else
		set(stabTrimmSW, 0)
    end
return 0
end
registerCommandHandler(pitch_UP_comm, 0, pitch_UP_hnd)

-- turn pitch trimmer DOWN
pitch_DOWN_comm = findCommand("sim/flight_controls/pitch_trim_down")
function pitch_DOWN_hnd(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if (1 == phase or 0 == phase) then
		set(stabTrimmSW, -1)
	else
		set(stabTrimmSW, 0)
    end
return 0
end
registerCommandHandler(pitch_DOWN_comm, 0, pitch_DOWN_hnd)

-- turn pitch trimmer center
pitch_TO_comm = findCommand("sim/flight_controls/pitch_trim_takeoff")
function pitch_TO_hnd(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if (1 == phase or 0 == phase) then
		set(elevator_trim, 0)
		H_stab_pos = 0
    end
return 0
end
registerCommandHandler(pitch_TO_comm, 0, pitch_TO_hnd)

-- turn roll trimmer LEFT
roll_LEFT_comm = findCommand("sim/flight_controls/aileron_trim_left")
function roll_LEFT_hnd(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if (1 == phase or 0 == phase) then
		set(aileronTrimmSW, -1)
	else
		set(aileronTrimmSW, 0)
    end
return 0
end
registerCommandHandler(roll_LEFT_comm, 0, roll_LEFT_hnd)

-- turn roll trimmer RIGHT
roll_RIGHT_comm = findCommand("sim/flight_controls/aileron_trim_right")
function roll_RIGHT_hnd(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if (1 == phase or 0 == phase) then
		set(aileronTrimmSW, 1)
	else
		set(aileronTrimmSW, 0)
    end
return 0
end
registerCommandHandler(roll_RIGHT_comm, 0, roll_RIGHT_hnd)

-- turn roll trimmer CTR
roll_CTR_comm = findCommand("sim/flight_controls/aileron_trim_center")
function roll_CTR_hnd(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if (1 == phase or 0 == phase) then
		ail_trimm_pos = 0
		set(aileronTrimmSW, 0)
    end
return 0
end
registerCommandHandler(roll_CTR_comm, 0, roll_CTR_hnd)

-- turn yaw trimmer LEFT
yaw_LEFT_comm = findCommand("sim/flight_controls/rudder_trim_left")
function yaw_LEFT_hnd(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if (1 == phase or 0 == phase) then
		set(ruddTrimmSW, -1)
	else
		set(ruddTrimmSW, 0)
    end
return 0
end
registerCommandHandler(yaw_LEFT_comm, 0, yaw_LEFT_hnd)

-- turn yaw trimmer RIGHT
yaw_RIGHT_comm = findCommand("sim/flight_controls/rudder_trim_right")
function yaw_RIGHT_hnd(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if (1 == phase or 0 == phase) then
		set(ruddTrimmSW, 1)
	else
		set(ruddTrimmSW, 0)
    end
return 0
end
registerCommandHandler(yaw_RIGHT_comm, 0, yaw_RIGHT_hnd)

-- turn yaw trimmer CTR
yaw_CTR_comm = findCommand("sim/flight_controls/rudder_trim_center")
function yaw_CTR_hnd(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if (1 == phase or 0 == phase) then
		rud_trimm_pos = 0
		set(ruddTrimmSW, 0)
    end
return 0
end
registerCommandHandler(yaw_CTR_comm, 0, yaw_CTR_hnd)

