-- this is flaps logic

-- enviroment
defineProperty("frame_time", globalPropertyf("sim/custom/xap/time/frame_time")) -- frame time
defineProperty("airspeed", globalPropertyf("sim/cockpit2/gauges/indicators/airspeed_kts_pilot"))
defineProperty("machno", globalPropertyf("sim/flightmodel/misc/machno"))
defineProperty("ground_spd", globalPropertyf("sim/flightmodel/position/groundspeed"))

-- flaps
defineProperty("flap_inn_L", globalPropertyf("sim/flightmodel2/wing/flap1_deg[0]")) -- inner flaps left
defineProperty("flap_inn_R", globalPropertyf("sim/flightmodel2/wing/flap1_deg[1]")) -- inner flaps right
defineProperty("flap_out_L", globalPropertyf("sim/flightmodel2/wing/flap2_deg[4]")) -- outer flaps left
defineProperty("flap_out_R", globalPropertyf("sim/flightmodel2/wing/flap2_deg[5]")) -- outer flaps right

defineProperty("sim_flap_time", globalPropertyf("sim/aircraft/controls/acf_flap_deftime")) -- time to make flaps full cycle
defineProperty("flap_ratio", globalPropertyf("sim/cockpit2/controls/flap_ratio"))

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
		if pos < 5 then speed = 0.6
		elseif pos < 13 then speed = 0.6
		elseif pos < 20 then speed = 2.41
		elseif pos < 25 then speed = 2.08
		elseif pos < 35 then speed = 2.38
		else speed = 1.94 end
	else -- for outboard flap
		if pos < 5 then speed = 0.6
		elseif pos < 13 then speed = 0.6
		elseif pos < 21 then speed = 2.83
		elseif pos < 26.5 then speed = 2.29
		elseif pos < 36.7 then speed = 2.43
		else speed = 1.52 end	
	end
	return speed	
end


		--[[ flaps values:
			handle		inboard		outboard
			0			0 deg		0			
			0.16667		0			0
			0.33333		13			12.8
			0.5			20			21
			0.66667		25			26.5
			0.83333		35			36.7
			1			41.4		41.7 deg
		--]]
					
local flap_inn_need = {{ 0, 0 }, -- 0
					{ 0.16667, 0 }, -- 1
					{ 0.33333, 13 }, -- 5
					{ 0.5, 20 }, -- 15
					{ 0.66667, 25 }, -- 20
					{ 0.83333, 35 }, -- 25
					{1, 41.4}, -- 30 units
					{9999999, 41.4}} -- extended limits

					
local flap_out_need = {{ 0, 0 }, -- 0
					{ 0.16667, 0 }, -- 1
					{ 0.33333, 12.8 }, -- 5
					{ 0.5, 21 }, -- 15
					{ 0.66667, 26.5 }, -- 20
					{ 0.83333, 36.7 }, -- 25
					{1, 41.7}, -- 30 units
					{9999999, 41.7}} -- extended limits


local flap_inn_deg_L = get(flap_inn_L)
local flap_inn_deg_R = get(flap_inn_R)
local flap_out_deg_L = get(flap_out_L)
local flap_out_deg_R = get(flap_out_R)

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

	-- flaps
	
	local flaps_comm = get(flap_ratio) -- commanded flaps ratio
		--[[ flaps values:
			handle		inboard		outboard
			0			0 deg		0			
			0.16667		0			0
			0.33333		13			12.8
			0.5			20			21
			0.66667		25			26.5
			0.83333		35			36.7
			1			41.4		41.7 deg
		--]]	

	local flap_spd_coef = 1 -- calculate this variable, using hydraulic and normal or alternate use
	-- alternate flap speed is 6 times slower
	
	-- calculate flaps commanded position and set airspeed dependencies
	local flap_inn_need_L = interpolate(flap_inn_need, flaps_comm)
	local flap_inn_need_R = interpolate(flap_inn_need, flaps_comm)
	local flap_out_need_L = interpolate(flap_out_need, flaps_comm)
	local flap_out_need_R = interpolate(flap_out_need, flaps_comm)

	-- auto retract flaps when overspeed
	if IAS > 170 and flap_inn_deg_L > 37 and flap_inn_need_L > 38 then flap_inn_need_L = 35 end
	if IAS > 180 and flap_inn_deg_L > 27 and flap_inn_need_L > 28 then flap_inn_need_L = 25 end

	if IAS > 170 and flap_inn_deg_R > 37 and flap_inn_need_R > 38 then flap_inn_need_R = 35 end
	if IAS > 180 and flap_inn_deg_R > 27 and flap_inn_need_R > 28 then flap_inn_need_R = 25 end

	if IAS > 170 and flap_out_deg_L > 37 and flap_out_need_L > 38 then flap_out_need_L = 35 end
	if IAS > 180 and flap_out_deg_L > 27 and flap_out_need_L > 28 then flap_out_need_L = 25 end

	if IAS > 170 and flap_out_deg_R > 37 and flap_out_need_R > 38 then flap_out_need_R = 35 end
	if IAS > 180 and flap_out_deg_R > 27 and flap_out_need_R > 28 then flap_out_need_R = 25 end	

	-- calculate flap new position
	flap_inn_deg_L = get(flap_inn_L)
	if flap_inn_deg_L < flap_inn_need_L - 0.01 then flap_inn_deg_L = flap_inn_deg_L + flap_speed(flap_inn_deg_L, true) * passed * flap_spd_coef
	elseif flap_inn_deg_L > flap_inn_need_L + 0.01 then flap_inn_deg_L = flap_inn_deg_L - flap_speed(flap_inn_deg_L, true) * passed * flap_spd_coef end

	flap_inn_deg_R = get(flap_inn_R)
	if flap_inn_deg_R < flap_inn_need_R - 0.01 then flap_inn_deg_R = flap_inn_deg_R + flap_speed(flap_inn_deg_R, true) * passed * flap_spd_coef
	elseif flap_inn_deg_R > flap_inn_need_R + 0.01 then flap_inn_deg_R = flap_inn_deg_R - flap_speed(flap_inn_deg_R, true) * passed * flap_spd_coef end

	flap_out_deg_L = get(flap_out_L)
	if flap_out_deg_L < flap_out_need_L - 0.01 then flap_out_deg_L = flap_out_deg_L + flap_speed(flap_out_deg_L, false) * passed * flap_spd_coef
	elseif flap_out_deg_L > flap_out_need_L + 0.01 then flap_out_deg_L = flap_out_deg_L - flap_speed(flap_out_deg_L, false) * passed * flap_spd_coef end

	flap_out_deg_R = get(flap_out_R)
	if flap_out_deg_R < flap_out_need_R - 0.01 then flap_out_deg_R = flap_out_deg_R + flap_speed(flap_out_deg_R, false) * passed * flap_spd_coef
	elseif flap_out_deg_R > flap_out_need_R + 0.01 then flap_out_deg_R = flap_out_deg_R - flap_speed(flap_out_deg_R, false) * passed * flap_spd_coef end

	-- set results
	set(flap_inn_L, flap_inn_deg_L)
	set(flap_inn_R, flap_inn_deg_R)
	set(flap_out_L, flap_out_deg_L)
	set(flap_out_R, flap_out_deg_R)	
	
	-- set sim flap time for sync slats
	set(sim_flap_time, 42 / (flap_speed((flap_inn_deg_L + flap_inn_deg_R) * 0.5, true)))
	
	




end