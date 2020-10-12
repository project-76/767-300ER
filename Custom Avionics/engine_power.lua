-- this is engine power corrections
defineProperty("acf_tmax", globalPropertyf("sim/aircraft/engine/acf_tmax")) -- max engine power
defineProperty("acf_fuse_cd", globalPropertyf("sim/aircraft/bodies/acf_fuse_cd")) -- drag coef of ruselage. initial 0.05
defineProperty("m_total", globalPropertyf("sim/flightmodel/weight/m_total")) -- total weight of acf in kg

defineProperty("thrust_L", globalPropertyf("sim/flightmodel/engine/POINT_thrust[0]")) -- thrust. in N, i guess
defineProperty("thrust_R", globalPropertyf("sim/flightmodel/engine/POINT_thrust[1]")) -- thrust. in N, i guess



-- barometric altitude
defineProperty("msl_alt", globalPropertyf("sim/flightmodel/position/elevation"))  -- barometric alt in meters.
defineProperty("baro_press", globalPropertyf("sim/weather/barometer_sealevel_inhg"))  -- pressure at sea level in.Hg

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


local function alt_mass_friction(alt, mass)
	-- this function will correct the fuselage drag to match long range cruise fuel consumption, which depends on engines thrust
	
	local mass180_tbl = {{ -100000, 1.00 },	{0, 1.00 }, {10000, 1.00 }, {15000, 1.00 }, {23000, 1.20 }, {27000, 1.20 }, {31000, 1.20 }, {35000, 1.70 }, {39000, 2.00 }, {43000, 3.00 }, {1000000, 10.00}}
	local mass160_tbl = {{ -100000, 1.00 },	{0, 1.00 }, {10000, 1.00 }, {15000, 1.00 }, {23000, 1.00 }, {27000, 1.05 }, {31000, 1.02 }, {35000, 1.10 }, {39000, 1.70 }, {43000, 2.50 }, {1000000, 10.00}}
	local mass140_tbl = {{ -100000, 1.00 },	{0, 1.00 }, {10000, 1.00 }, {15000, 1.00 }, {23000, 0.87 }, {27000, 0.90 }, {31000, 0.90 }, {35000, 0.85 }, {39000, 1.40 }, {43000, 2.00 }, {1000000, 10.00}}
	local mass120_tbl = {{ -100000, 1.00 },	{0, 1.00 }, {10000, 1.00 }, {15000, 1.00 }, {23000, 0.65 }, {27000, 0.70 }, {31000, 0.80 }, {35000, 0.75 }, {39000, 1.05 }, {43000, 1.85 }, {1000000, 10.00}}
	local mass100_tbl = {{ -100000, 1.00 },	{0, 1.00 }, {10000, 1.00 }, {15000, 1.00 }, {23000, 0.55 }, {27000, 0.45 }, {31000, 0.50 }, {35000, 0.60 }, {39000, 0.90 }, {43000, 1.15 }, {1000000, 10.00}}
	
	-- search for closest mass and get interpolated value by altitude
	local res_low = 1
	local res_high = 1
	local low_value = 100
	if mass >= 160 then
		res_low = interpolate(mass160_tbl, alt)
		res_high = interpolate(mass180_tbl, alt)
		low_value = 160
	elseif mass >= 140 then
		res_low = interpolate(mass140_tbl, alt)
		res_high = interpolate(mass160_tbl, alt)
		low_value = 140
	elseif mass >= 120 then
		res_low = interpolate(mass120_tbl, alt)
		res_high = interpolate(mass140_tbl, alt)
		low_value = 120
	else
		res_low = interpolate(mass100_tbl, alt)
		res_high = interpolate(mass120_tbl, alt)
		low_value = 100
	end
	
	-- interpolate between values
	local y1 = res_low
	local y2 = res_high
	local x1 = 0
	local x2 = 20
	local x = mass - low_value
	
	local y = y1 + (y2 - y1) / (x2 - x1) * (x - x1)
	
	return y


end



local function descend_friction(alt, mass)
	-- this function will correct the fuselage drag to match long range cruise fuel consumption, which depends on engines thrust
	
	local mass180_tbl = {{ -100000, 0.5 },	{0, 0.90 }, {10000, 0.70 }, {20000, 0.70 }, {30000, 0.90 }, {40000, 1.00 }, {1000000, 10.00}}
	local mass160_tbl = {{ -100000, 0.5 },	{0, 0.70 }, {10000, 0.90 }, {20000, 0.90 }, {30000, 1.00 }, {40000, 0.90 }, {1000000, 10.00}}
	local mass140_tbl = {{ -100000, 0.5 },	{0, 0.70 }, {10000, 1.00 }, {20000, 1.00 }, {30000, 1.10 }, {40000, 0.80 }, {1000000, 10.00}}
	local mass120_tbl = {{ -100000, 0.5 },	{0, 0.70 }, {10000, 1.20 }, {20000, 1.20 }, {30000, 1.20 }, {40000, 0.70 }, {1000000, 10.00}}
	local mass100_tbl = {{ -100000, 0.5 },	{0, 0.90 }, {10000, 1.20 }, {20000, 1.30 }, {30000, 1.20 }, {40000, 0.60 }, {1000000, 10.00}}
	
	-- search for closest mass and get interpolated value by altitude
	local res_low = 1
	local res_high = 1
	local low_value = 100
	if mass >= 160 then
		res_low = interpolate(mass160_tbl, alt)
		res_high = interpolate(mass180_tbl, alt)
		low_value = 160
	elseif mass >= 140 then
		res_low = interpolate(mass140_tbl, alt)
		res_high = interpolate(mass160_tbl, alt)
		low_value = 140
	elseif mass >= 120 then
		res_low = interpolate(mass120_tbl, alt)
		res_high = interpolate(mass140_tbl, alt)
		low_value = 120
	else
		res_low = interpolate(mass100_tbl, alt)
		res_high = interpolate(mass120_tbl, alt)
		low_value = 100
	end
	
	-- interpolate between values
	local y1 = res_low
	local y2 = res_high
	local x1 = 0
	local x2 = 20
	local x = mass - low_value
	
	local y = y1 + (y2 - y1) / (x2 - x1) * (x - x1)
	
	return y


end



local eng_alt_pow = {{ -100000, 1.00 }, -- extended limits
					{0, 1.10 }, -- 0 feet MSL
					{5000, 1.32 }, -- 
					{10000, 1.235 }, -- 
					{15000, 1.025 }, -- 
					{20000, 1.035 }, --
					{25000, 1.01 }, -- 
					{30000, 1.068 }, -- 
					{35000, 1.13 }, -- 
					{40000, 1.05 }, --
					{45000, 1.00 }, --
					{1000000, 0.01}} -- extended limits
					
					
function update()
	

	-- calculate altitude coef
	local real_alt = get(msl_alt) * 3.28083 + (29.92 - get(baro_press)) * 1000  -- calculate barometric altitude in feet
	if real_alt < -10000 then real_alt = -10000
	elseif real_alt > 100000 then real_alt = 100000 end
	
	-- engine's power
	local engine_power = 60200 * 4.45 -- initial engine power in newtons	
	local eng_alt_coef = interpolate(eng_alt_pow, real_alt)
	set(acf_tmax, engine_power * eng_alt_coef)
	
	-- fuselage Cd tweaks
	local fuse_Cd = 0.05
	local fuse_Cd_route = alt_mass_friction(real_alt, get(m_total) * 0.001)
	local fuse_Cd_descend = descend_friction(real_alt, get(m_total) * 0.001)

	-- interpolate between values
	local y1 = fuse_Cd_descend
	local y2 = fuse_Cd_route
	-- x1 = 0, x2 = 1 - get rid of them.
	local x = (get(thrust_L) + get(thrust_R)) * 0.2248 / 10000
	if x < 0 then x = 0
	elseif x > 1 then x = 1 end
	
	local y = y1 + (y2 - y1) * x
	
	--print(fuse_Cd_route, fuse_Cd_descend, y)
	
	set(acf_fuse_cd, fuse_Cd * y)
	
	

end


