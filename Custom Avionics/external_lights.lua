-- this is the external lights logic
size = {2048, 2048}
-- create custom properties
createProp("sim/custom/xap/lights/position_button", "int", 0); -- position lights
createProp("sim/custom/xap/lights/AC_red_button", "int", 0); -- anti collision red strobe button
createProp("sim/custom/xap/lights/AC_white_button", "int", 0); -- anti collision white strobe button
createProp("sim/custom/xap/lights/wing_button", "int", 0); -- wing light button
createProp("sim/custom/xap/lights/logo_button", "int", 0); -- tail logo button

createProp("sim/custom/xap/lights/landing_L_switch", "int", 0); -- landing wing left light switch
createProp("sim/custom/xap/lights/landing_R_switch", "int", 0); -- landing wing right light switch
createProp("sim/custom/xap/lights/landing_nose_switch", "int", 0); -- landing wing nosewheel light switch

createProp("sim/custom/xap/lights/taxi_switch", "int", 0); -- taxi switch
createProp("sim/custom/xap/lights/runway_switch", "int", 0); -- runway switch L
createProp("sim/custom/xap/lights/turnout_switch", "int", 0); -- runway switch R


createProp("sim/custom/xap/lights/position_lamp", "float", 0); -- position lights
createProp("sim/custom/xap/lights/AC_red_lamp", "float", 0); -- anti collision red strobe lamp
createProp("sim/custom/xap/lights/AC_red_lamp_shine", "float", 0); -- anti collision red strobe lamp
createProp("sim/custom/xap/lights/AC_white_lamp", "float", 0); -- anti collision white strobe lamp
createProp("sim/custom/xap/lights/wing_lamp", "float", 0); -- wing light lamp
createProp("sim/custom/xap/lights/logo_lamp", "float", 0); -- tail logo lamp

createProp("sim/custom/xap/lights/taxi_lamp", "float", 0); -- taxi lamp
createProp("sim/custom/xap/lights/runway_L_lamp", "float", 0); -- runway lamp
createProp("sim/custom/xap/lights/runway_R_lamp", "float", 0); -- runway lamp

createProp("sim/custom/xap/lights/cargo", "float", 0); -- cargo illumination
createProp("sim/custom/xap/lights/cargo_door", "float", 0); -- cargo illumination
createProp("sim/custom/xap/lights/left_lamp", "float", 0); -- overall shine from left taxi and landing lamps
createProp("sim/custom/xap/lights/right_lamp", "float", 0); -- overall shine from left taxi and landing lamps

--createProp("sim/custom/xap/lights/landing_L_lamp", "int", 0); -- landing lights
--createProp("sim/custom/xap/lights/landing_R_lamp", "int", 0); -- landing lights



-- define properties
-- controls
defineProperty("position_button", globalPropertyi("sim/custom/xap/lights/position_button")) -- red, green, white lights
defineProperty("AC_red_button", globalPropertyi("sim/custom/xap/lights/AC_red_button")) -- red strobe
defineProperty("AC_white_button", globalPropertyi("sim/custom/xap/lights/AC_white_button")) -- white strobe
defineProperty("wing_button", globalPropertyi("sim/custom/xap/lights/wing_button")) -- wing inspection lights
defineProperty("logo_button", globalPropertyi("sim/custom/xap/lights/logo_button")) -- logo lights

defineProperty("landing_L_switch", globalPropertyi("sim/custom/xap/lights/landing_L_switch")) -- wing landing light
defineProperty("landing_R_switch", globalPropertyi("sim/custom/xap/lights/landing_R_switch")) -- wing landing light
defineProperty("landing_nose_switch", globalPropertyi("sim/custom/xap/lights/landing_nose_switch")) -- nose landing light

defineProperty("taxi_switch", globalPropertyi("sim/custom/xap/lights/taxi_switch")) -- nose taxi lamp
defineProperty("runway_L", globalPropertyi("sim/custom/xap/lights/runway_switch")) -- runway switch
defineProperty("runway_R", globalPropertyi("sim/custom/xap/lights/turnout_switch")) -- runway switch

-- sim lights
defineProperty("sim_lan_light_angle", globalPropertyf("sim/aircraft/view/acf_lanlite_the")) -- angle of OpenGL light
defineProperty("sim_taxi_light_sw", globalPropertyf("sim/cockpit/electrical/taxi_light_on")) -- sim landing light switcher
--defineProperty("sim_lan_light_sw", globalPropertyf("sim/cockpit/electrical/landing_lights_on")) -- sim landing light switcher
defineProperty("sim_nav_light_sw", globalPropertyf("sim/cockpit/electrical/nav_lights_on")) -- sim nav light switcher
defineProperty("sim_strob_light_sw", globalPropertyf("sim/cockpit/electrical/strobe_lights_on"))
defineProperty("sim_bec_light_sw", globalPropertyf("sim/cockpit/electrical/beacon_lights_on")) -- sim nav light switcher

defineProperty("sim_lan_light_ratio1", globalPropertyf("sim/cockpit2/switches/landing_lights_switch[0]")) -- left landing lamp
defineProperty("sim_lan_light_ratio2", globalPropertyf("sim/cockpit2/switches/landing_lights_switch[1]")) -- right landing lamp
defineProperty("sim_lan_light_ratio3", globalPropertyf("sim/cockpit2/switches/landing_lights_switch[2]")) -- nose landing lamp

defineProperty("position_lamp", globalPropertyf("sim/custom/xap/lights/position_lamp")) --
defineProperty("AC_red_lamp", globalPropertyf("sim/custom/xap/lights/AC_red_lamp")) --
defineProperty("AC_red_lamp_shine", globalPropertyf("sim/custom/xap/lights/AC_red_lamp_shine")) --
defineProperty("AC_white_lamp", globalPropertyf("sim/custom/xap/lights/AC_white_lamp")) --
defineProperty("wing_lamp", globalPropertyf("sim/custom/xap/lights/wing_lamp")) --
defineProperty("logo_lamp", globalPropertyf("sim/custom/xap/lights/logo_lamp")) --

defineProperty("taxi_lamp", globalPropertyi("sim/custom/xap/lights/taxi_lamp")) --
defineProperty("runway_L_lamp", globalPropertyi("sim/custom/xap/lights/runway_L_lamp")) -- runway lamp
defineProperty("runway_R_lamp", globalPropertyi("sim/custom/xap/lights/runway_R_lamp")) -- runway lamp

defineProperty("cargo", globalPropertyf("sim/custom/xap/lights/cargo")) --
defineProperty("cargo_door", globalPropertyf("sim/custom/xap/lights/cargo_door")) --
defineProperty("left_lamp", globalPropertyf("sim/custom/xap/lights/left_lamp")) --
defineProperty("right_lamp", globalPropertyf("sim/custom/xap/lights/right_lamp")) --


-- sim/graphics/scenery/percent_lights_on
-- sim/flightmodel2/misc/custom_slider_ratio[7]

defineProperty("nose_gear_dn", globalPropertyf("sim/flightmodel2/gear/deploy_ratio[0]")) -- nosegear
defineProperty("percent_lights_on", globalPropertyf("sim/graphics/scenery/percent_lights_on")) -- world lights
defineProperty("cargo_open", globalPropertyf("sim/flightmodel2/misc/custom_slider_ratio[7]")) -- carg door open

--defineProperty("landing_L_lamp", globalPropertyi("sim/custom/xap/lights/landing_L_lamp")) --
--defineProperty("landing_R_lamp", globalPropertyi("sim/custom/xap/lights/landing_R_lamp")) --

defineProperty("frame_time", globalPropertyf("sim/custom/xap/time/frame_time")) -- frame time

local red_strob_counter = 0
local white_strob_counter = 0

local red_period = 1.2
local red_long = 0.05

local white_period = 1.2
local white_long = 0.05

function update()
	local passed = get(frame_time)
	local power = 1 -- this is lights power variable. must be connected with power logic
	
	local light_coef = get(percent_lights_on) * 0.9 + 0.1
	
	-- landing lights
	local landing_gear_down = 0
	if get(nose_gear_dn) > 0.9 then landing_gear_down = 1 end
	--set(sim_lan_light_sw, math.max(1, (get(landing_L_switch) + get(landing_R_switch)) * power))
	--set(landing_L_lamp, get(landing_L_switch) * power)
	--set(landing_R_lamp, get(landing_R_switch) * power)
	set(sim_lan_light_ratio1, get(landing_L_switch) * power)
	set(sim_lan_light_ratio2, get(landing_R_switch) * power)
	set(sim_lan_light_ratio3, get(landing_nose_switch) * power * landing_gear_down)
	
	-- taxi light
	set(sim_taxi_light_sw, math.min(1, (get(taxi_switch) * landing_gear_down + get(runway_L) + get(runway_R)) * power))
	set(taxi_lamp, get(taxi_switch) * landing_gear_down * power)
	set(runway_L_lamp, get(runway_L) * power)
	set(runway_R_lamp, get(runway_R) * power)
	
	-- nav lights
	set(sim_nav_light_sw, get(position_button) * power)
	set(position_lamp, get(position_button) * power)
	
	-- textures shine
	set(left_lamp, light_coef * math.min(1, get(runway_L_lamp) * 0.5 + get(sim_lan_light_ratio1)))
	set(right_lamp, light_coef * math.min(1, get(runway_R_lamp) * 0.5 + get(sim_lan_light_ratio2)))
	set(cargo_door, light_coef * math.min(1, get(runway_R_lamp) * 0.5 + get(sim_lan_light_ratio2)) * (1 - get(cargo_open)))
	set(cargo, light_coef * power)
	
	-- strobes
	if get(AC_red_button) * power == 1 then 
		red_strob_counter = red_strob_counter + passed 
		set(sim_bec_light_sw, 1)
	else 
		red_strob_counter = 0 
		set(sim_bec_light_sw, 0) 
	end
	
	if get(AC_white_button) * power == 1 then 
		white_strob_counter = white_strob_counter + passed 
		set(sim_strob_light_sw, 1)
	else 
		white_strob_counter = 0 
		set(sim_strob_light_sw, 0) 
	end
	
	if red_strob_counter > red_period + red_long then set(AC_red_lamp, 0) red_strob_counter = 0 set(AC_red_lamp_shine, 0)
	elseif red_strob_counter > red_period then set(AC_red_lamp, 1) set(AC_red_lamp_shine, 0.5 * light_coef)
	else set(AC_red_lamp, 0) set(AC_red_lamp_shine, 0) end
	
	if white_strob_counter > white_period + white_long then set(AC_white_lamp, 0) white_strob_counter = 0
	elseif white_strob_counter > white_period then set(AC_white_lamp, 1) 
	else set(AC_white_lamp, 0) end
	
	-- misc lamps
	set(logo_lamp, get(logo_button) * power * light_coef)
	set(wing_lamp, get(wing_button) * power * light_coef)
	
	-- temp test sets :)
	--set(AC_red_lamp_shine, 0.5)
	--set(AC_red_lamp, 1)


end


local switcher_pushed = false
local btn_click = loadSample('Custom Sounds/plastic_btn.wav')
local swch_click = loadSample('Custom Sounds/metal_switch.wav')

components = {
	
	-- taxi switch
    switch {
        position = {1499, 568, 26, 26},
        state = function()
            return get(taxi_switch) ~= 0
        end,
        --btnOn = get(tmb_up),
        --btnOff = get(tmb_dn),
        onMouseClick = function()
            if not switcher_pushed then
				playSample(swch_click, 0)
				if get(taxi_switch) ~= 0 then
					set(taxi_switch, 0)
				else
					set(taxi_switch, 1)
				end
				switcher_pushed = true
			end
			return true;
        end,
		onMouseUp = function()
			switcher_pushed = false
		end,
    },

	-- taxi switch L
    switch {
        position = {1530, 568, 26, 26},
        state = function()
            return get(runway_L) ~= 0
        end,
        --btnOn = get(tmb_up),
        --btnOff = get(tmb_dn),
        onMouseClick = function()
            if not switcher_pushed then
				playSample(swch_click, 0)
				if get(runway_L) ~= 0 then
					set(runway_L, 0)
				else
					set(runway_L, 1)
				end
				switcher_pushed = true
			end
			return true;
        end,
		onMouseUp = function()
			switcher_pushed = false
		end,
    },

	-- taxi switch R
    switch {
        position = {1560, 568, 26, 26},
        state = function()
            return get(runway_R) ~= 0
        end,
        --btnOn = get(tmb_up),
        --btnOff = get(tmb_dn),
        onMouseClick = function()
            if not switcher_pushed then
				playSample(swch_click, 0)
				if get(runway_R) ~= 0 then
					set(runway_R, 0)
				else
					set(runway_R, 1)
				end
				switcher_pushed = true
			end
			return true;
        end,
		onMouseUp = function()
			switcher_pushed = false
		end,
    },
	
	-- landing switch L
    switch {
        position = {1499, 538, 26, 26},
        state = function()
            return get(landing_L_switch) ~= 0
        end,
        --btnOn = get(tmb_up),
        --btnOff = get(tmb_dn),
        onMouseClick = function()
            if not switcher_pushed then
				playSample(swch_click, 0)
				if get(landing_L_switch) ~= 0 then
					set(landing_L_switch, 0)
				else
					set(landing_L_switch, 1)
				end
				switcher_pushed = true
			end
			return true;
        end,
		onMouseUp = function()
			switcher_pushed = false
		end,
    },	
	
	-- landing switch R
    switch {
        position = {1530, 538, 26, 26},
        state = function()
            return get(landing_R_switch) ~= 0
        end,
        --btnOn = get(tmb_up),
        --btnOff = get(tmb_dn),
        onMouseClick = function()
            if not switcher_pushed then
				playSample(swch_click, 0)
				if get(landing_R_switch) ~= 0 then
					set(landing_R_switch, 0)
				else
					set(landing_R_switch, 1)
				end
				switcher_pushed = true
			end
			return true;
        end,
		onMouseUp = function()
			switcher_pushed = false
		end,
    },	
		
	-- landing switch nose
    switch {
        position = {1563, 538, 26, 26},
        state = function()
            return get(landing_nose_switch) ~= 0
        end,
        --btnOn = get(tmb_up),
        --btnOff = get(tmb_dn),
        onMouseClick = function()
            if not switcher_pushed then
				playSample(swch_click, 0)
				if get(landing_nose_switch) ~= 0 then
					set(landing_nose_switch, 0)
				else
					set(landing_nose_switch, 1)
				end
				switcher_pushed = true
			end
			return true;
        end,
		onMouseUp = function()
			switcher_pushed = false
		end,
    },		
	
	-- position button
    switch {
        position = {404, 164, 76, 76},
        state = function()
            return get(position_button) ~= 0
        end,
        --btnOn = get(tmb_up),
        --btnOff = get(tmb_dn),
        onMouseClick = function()
            if not switcher_pushed then
				playSample(btn_click, 0)
				if get(position_button) ~= 0 then
					set(position_button, 0)
				else
					set(position_button, 1)
				end
				switcher_pushed = true
			end
			return true;
        end,
		onMouseUp = function()
			switcher_pushed = false
		end,
    },	
	
	-- red strobes button
    switch {
        position = {484, 164, 76, 76},
        state = function()
            return get(AC_red_button) ~= 0
        end,
        --btnOn = get(tmb_up),
        --btnOff = get(tmb_dn),
        onMouseClick = function()
            if not switcher_pushed then
				playSample(btn_click, 0)
				if get(AC_red_button) ~= 0 then
					set(AC_red_button, 0)
				else
					set(AC_red_button, 1)
				end
				switcher_pushed = true
			end
			return true;
        end,
		onMouseUp = function()
			switcher_pushed = false
		end,
    },	
	
	-- white strobes button
    switch {
        position = {564, 164, 76, 76},
        state = function()
            return get(AC_white_button) ~= 0
        end,
        --btnOn = get(tmb_up),
        --btnOff = get(tmb_dn),
        onMouseClick = function()
            if not switcher_pushed then
				playSample(btn_click, 0)
				if get(AC_white_button) ~= 0 then
					set(AC_white_button, 0)
				else
					set(AC_white_button, 1)
				end
				switcher_pushed = true
			end
			return true;
        end,
		onMouseUp = function()
			switcher_pushed = false
		end,
    },	
	
	-- wing button
    switch {
        position = {644, 164, 76, 76},
        state = function()
            return get(wing_button) ~= 0
        end,
        --btnOn = get(tmb_up),
        --btnOff = get(tmb_dn),
        onMouseClick = function()
            if not switcher_pushed then
				playSample(btn_click, 0)
				if get(wing_button) ~= 0 then
					set(wing_button, 0)
				else
					set(wing_button, 1)
				end
				switcher_pushed = true
			end
			return true;
        end,
		onMouseUp = function()
			switcher_pushed = false
		end,
    },	
	
	-- logo button
    switch {
        position = {323, 84, 76, 76},
        state = function()
            return get(logo_button) ~= 0
        end,
        --btnOn = get(tmb_up),
        --btnOff = get(tmb_dn),
        onMouseClick = function()
            if not switcher_pushed then
				playSample(btn_click, 0)
				if get(logo_button) ~= 0 then
					set(logo_button, 0)
				else
					set(logo_button, 1)
				end
				switcher_pushed = true
			end
			return true;
        end,
		onMouseUp = function()
			switcher_pushed = false
		end,
    },		
	
	
	
	
	
	
	
	
	
	

}

