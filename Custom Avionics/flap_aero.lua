defineProperty("cl", globalPropertyf("sim/aircraft/controls/acf_flap_cl"))
defineProperty("cd", globalPropertyf("sim/aircraft/controls/acf_flap_cd"))
defineProperty("cm", globalPropertyf("sim/aircraft/controls/acf_flap_cm"))
defineProperty("cl2", globalPropertyf("sim/aircraft/controls/acf_flap2_cl"))
defineProperty("cd2", globalPropertyf("sim/aircraft/controls/acf_flap2_cd"))
defineProperty("cm2", globalPropertyf("sim/aircraft/controls/acf_flap2_cm"))
defineProperty("flap", globalPropertyf("sim/flightmodel/controls/flaprat"))
defineProperty("alt", globalPropertyf("sim/cockpit2/gauges/indicators/radio_altimeter_height_ft_pilot"))

defineProperty("flap_inn_L", globalPropertyf("sim/flightmodel2/wing/flap1_deg[0]")) -- inner flaps left
defineProperty("flap_inn_R", globalPropertyf("sim/flightmodel2/wing/flap1_deg[1]")) -- inner flaps right
defineProperty("flap_out_L", globalPropertyf("sim/flightmodel2/wing/flap2_deg[4]")) -- outer flaps left
defineProperty("flap_out_R", globalPropertyf("sim/flightmodel2/wing/flap2_deg[5]")) -- outer flaps right

-- initial values are:
-- inner flap 1 Cl = 0.754, Cd = 0.047, Cm = -0.217
-- outer flap 2 Cl = 1.119, Cd = 0.046, Cm = -0.324

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

local flap1_Cl_tbl = {{ -50, 0.70 }, -- flaps UP
					{ 13, 0.70 }, -- 5 units
					{ 20, 0.55 }, -- 15 units
					{ 25, 0.75 }, -- 20 units
					{35, 1.00}, -- 25 units
					{41, 1.00 }, -- 30 units
					{100, 2.0}} -- extended limits

local flap2_Cl_tbl = {{ -50, 1.00 }, -- flaps UP
					{ 13, 1.00 }, -- 5 units
					{ 20, 0.82 }, -- 15 units
					{ 25, 1.25 }, -- 20 units
					{35, 1.5}, -- 25 units
					{41, 1.5 }, -- 30 units
					{100, 2.0}} -- extended limits

					
local flap1_Cd_tbl = {{ -50, 0.085 }, -- flaps UP
					{ 13, 0.085 }, -- 5 units
					{ 20, 0.080 }, -- 15 units
					{ 25, 0.133 }, -- 20 units
					{35, 0.047}, -- 25 units
					{41, 0.040 }, -- 30 units
					{100, 0.047}} -- extended limits

local flap2_Cd_tbl = {{ -50, 0.075 }, -- flaps UP
					{ 13, 0.075 }, -- 5 units
					{ 20, 0.070 }, -- 15 units
					{ 25, 0.105 }, -- 20 units
					{35, 0.046}, -- 25 units
					{41, 0.035 }, -- 30 units
					{100, 0.046}} -- extended limits

					
local flap1_Cm_tbl = {{ -50, -0.55 }, -- flaps UP
					{ 13, -0.55 }, -- 5 units
					{ 20, -0.30 }, -- 15 units
					{ 25, -0.55 }, -- 20 units
					{35, -0.70}, -- 25 units
					{41, -0.65 }, -- 30 units
					{100, -0.65}} -- extended limits
					
local flap2_Cm_tbl = {{ -50, -0.65 }, -- flaps UP
					{ 13, -0.65 }, -- 5 units
					{ 20, -0.40 }, -- 15 units
					{ 25, -0.60 }, -- 20 units
					{35, -0.80}, -- 25 units
					{41, -0.75 }, -- 30 units
					{100, -0.75}} -- extended limits
					

function update()
	local flap1_deg = (get(flap_inn_L) + get(flap_inn_R)) * 0.5
	local flap2_deg = (get(flap_out_L) + get(flap_out_R)) * 0.5

	set(cl , interpolate(flap1_Cl_tbl, flap1_deg))
	set(cd , interpolate(flap1_Cd_tbl, flap1_deg))
	set(cm , interpolate(flap1_Cm_tbl, flap1_deg))

	set(cl2 , interpolate(flap2_Cl_tbl, flap2_deg))
	set(cd2 , interpolate(flap2_Cd_tbl, flap2_deg))
	set(cm2 , interpolate(flap2_Cm_tbl, flap2_deg))
end
