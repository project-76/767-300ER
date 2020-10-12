-- this is the cockpit lights logic
size = {2048, 2048}
-- create needed datarefs
-- LIT lextures
createProp("sim/custom/xap/lights/left_panel_gau", "float", 0); -- brightness of LIT 0...1
createProp("sim/custom/xap/lights/right_panel_gau", "float", 0); -- brightness of LIT 0...1
createProp("sim/custom/xap/lights/left_map", "float", 0); -- brightness of LIT 0...1
createProp("sim/custom/xap/lights/right_map", "float", 0); -- brightness of LIT 0...1
createProp("sim/custom/xap/lights/AP_marks", "float", 0); -- brightness of LIT 0...1
createProp("sim/custom/xap/lights/AP_panel", "float", 0); -- brightness of LIT 0...1
createProp("sim/custom/xap/lights/circuit_br_marks", "float", 0); -- brightness of LIT 0...1
createProp("sim/custom/xap/lights/overhead_marks", "float", 0); -- brightness of LIT 0...1
createProp("sim/custom/xap/lights/pedestal_marks", "float", 0); -- brightness of LIT 0...1
createProp("sim/custom/xap/lights/pedestal_panel", "float", 0); -- brightness of LIT 0...1
createProp("sim/custom/xap/lights/back_panel", "float", 0); -- brightness of LIT 0...1
createProp("sim/custom/xap/lights/exit_lamp", "float", 0); -- brightness of LIT 0...1
createProp("sim/custom/xap/lights/salon_light", "float", 0); -- brightness of LIT 0...1


createProp("sim/custom/xap/lights/no_lit", "float", 0); -- brightness of all things, that don't LIT 0...1

createProp("sim/custom/xap/lights/left_panel_gau_rotary", "float", 0); -- control rhotary
createProp("sim/custom/xap/lights/right_panel_gau_rotary", "float", 0); -- control rhotary
createProp("sim/custom/xap/lights/left_map_rotary", "float", 0); -- control rhotary
createProp("sim/custom/xap/lights/right_map_rotary", "float", 0); -- control rhotary
createProp("sim/custom/xap/lights/AP_marks_rotary", "float", 0); -- control rhotary
createProp("sim/custom/xap/lights/AP_panel_rotary", "float", 0); -- control rhotary
createProp("sim/custom/xap/lights/circuit_br_marks_rotary", "float", 0); -- control rhotary
createProp("sim/custom/xap/lights/overhead_marks_rotary", "float", 0); -- control rhotary
createProp("sim/custom/xap/lights/pedestal_marks_rotary", "float", 0); -- control rhotary
createProp("sim/custom/xap/lights/pedestal_panel_rotary", "float", 0); -- control rhotary

createProp("sim/custom/xap/lights/left_panel_rotary", "float", 0); -- control rhotary
createProp("sim/custom/xap/lights/right_panel_rotary", "float", 0); -- control rhotary
createProp("sim/custom/xap/lights/cabin_flood_rotary", "float", 0); -- control rhotary
createProp("sim/custom/xap/lights/backpanel_rotary", "float", 0); -- control rhotary

createProp("sim/custom/xap/lights/lt_ovrd_button", "int", 0); -- light override button

-- define properties
-- results
defineProperty("left_panel_gau", globalPropertyf("sim/custom/xap/lights/left_panel_gau")) -- brightness of LIT 0...1
defineProperty("right_panel_gau", globalPropertyf("sim/custom/xap/lights/right_panel_gau")) -- brightness of LIT 0...1
defineProperty("left_map", globalPropertyf("sim/custom/xap/lights/left_map")) -- brightness of LIT 0...1
defineProperty("right_map", globalPropertyf("sim/custom/xap/lights/right_map")) -- brightness of LIT 0...1
defineProperty("AP_marks", globalPropertyf("sim/custom/xap/lights/AP_marks")) -- brightness of LIT 0...1
defineProperty("AP_panel", globalPropertyf("sim/custom/xap/lights/AP_panel")) -- brightness of LIT 0...1
defineProperty("circuit_br_marks", globalPropertyf("sim/custom/xap/lights/circuit_br_marks")) -- brightness of LIT 0...1
defineProperty("overhead_marks", globalPropertyf("sim/custom/xap/lights/overhead_marks")) -- brightness of LIT 0...1
defineProperty("pedestal_marks", globalPropertyf("sim/custom/xap/lights/pedestal_marks")) -- brightness of LIT 0...1
defineProperty("pedestal_panel", globalPropertyf("sim/custom/xap/lights/pedestal_panel")) -- brightness of LIT 0...1
defineProperty("back_panel", globalPropertyf("sim/custom/xap/lights/back_panel")) -- brightness of LIT 0...1
defineProperty("exit_lamp", globalPropertyf("sim/custom/xap/lights/exit_lamp")) -- brightness of LIT 0...1

defineProperty("salon_light", globalPropertyf("sim/custom/xap/lights/salon_light")) -- brightness of LIT 0...1

defineProperty("spotlight_left", globalPropertyf("sim/cockpit2/switches/panel_brightness_ratio[1]")) -- brightness of lamp 0...1
defineProperty("spotlight_right", globalPropertyf("sim/cockpit2/switches/panel_brightness_ratio[2]")) -- brightness of lamp 0...1
defineProperty("spotlight_center", globalPropertyf("sim/cockpit2/switches/panel_brightness_ratio[3]")) -- brightness of lamp 0...1

defineProperty("panel_brightness", globalPropertyf("sim/cockpit2/switches/panel_brightness_ratio[0]")) -- brightness of panel 0...1

-- controls
defineProperty("left_panel_gau_rotary", globalPropertyf("sim/custom/xap/lights/left_panel_gau_rotary")) -- brightness of LIT 0...1
defineProperty("right_panel_gau_rotary", globalPropertyf("sim/custom/xap/lights/right_panel_gau_rotary")) -- brightness of LIT 0...1
defineProperty("left_map_rotary", globalPropertyf("sim/custom/xap/lights/left_map_rotary")) -- brightness of LIT 0...1
defineProperty("right_map_rotary", globalPropertyf("sim/custom/xap/lights/right_map_rotary")) -- brightness of LIT 0...1
defineProperty("AP_marks_rotary", globalPropertyf("sim/custom/xap/lights/AP_marks_rotary")) -- brightness of LIT 0...1
defineProperty("AP_panel_rotary", globalPropertyf("sim/custom/xap/lights/AP_panel_rotary")) -- brightness of LIT 0...1
defineProperty("circuit_br_marks_rotary", globalPropertyf("sim/custom/xap/lights/circuit_br_marks_rotary")) -- brightness of LIT 0...1
defineProperty("overhead_marks_rotary", globalPropertyf("sim/custom/xap/lights/overhead_marks_rotary")) -- brightness of LIT 0...1
defineProperty("pedestal_marks_rotary", globalPropertyf("sim/custom/xap/lights/pedestal_marks_rotary")) -- brightness of LIT 0...1
defineProperty("pedestal_panel_rotary", globalPropertyf("sim/custom/xap/lights/pedestal_panel_rotary")) -- brightness of LIT 0...1
defineProperty("left_panel_rotary", globalPropertyf("sim/custom/xap/lights/left_panel_rotary")) -- brightness of LIT 0...1
defineProperty("right_panel_rotary", globalPropertyf("sim/custom/xap/lights/right_panel_rotary")) -- brightness of LIT 0...1
defineProperty("cabin_flood_rotary", globalPropertyf("sim/custom/xap/lights/cabin_flood_rotary")) -- brightness of LIT 0...1
defineProperty("backpanel_rotary", globalPropertyf("sim/custom/xap/lights/backpanel_rotary")) -- brightness of LIT 0...1

defineProperty("lt_ovrd_button", globalPropertyi("sim/custom/xap/lights/lt_ovrd_button")) -- brightness of LIT 0...1

function update()
	local power = 1 -- this is lights power variable. must be connected with power logic
	
	-- set lamps and textures brightness
	local ovrd = get(lt_ovrd_button)
	
	set(left_panel_gau, get(left_panel_gau_rotary) * power)
	set(right_panel_gau, get(right_panel_gau_rotary) * power)
	set(left_map, get(left_map_rotary) * power)
	set(right_map, get(right_map_rotary) * power)
	set(AP_marks, math.max(get(AP_marks_rotary), get(AP_panel_rotary)) * power)
	set(AP_panel, get(AP_panel_rotary) * power)
	set(circuit_br_marks, get(circuit_br_marks_rotary) * power)
	set(overhead_marks, get(overhead_marks_rotary) * power)
	set(pedestal_marks, math.max(get(pedestal_marks_rotary), get(pedestal_panel_rotary)) * power)
	set(pedestal_panel, get(pedestal_panel_rotary) * power)
	set(spotlight_left, get(left_panel_rotary) * power * 2)
	set(spotlight_right, get(right_panel_rotary) * power * 2)
	set(spotlight_center, get(cabin_flood_rotary) * power * 1.5)
	set(panel_brightness, get(cabin_flood_rotary) * power * 0.5)
	set(back_panel, get(backpanel_rotary) * power)
	set(exit_lamp, 1)
	set(salon_light, power)
	
	if ovrd * power == 1 then
		set(spotlight_left, 2)
		set(spotlight_right, 2)
		set(spotlight_center, 1.5)
		set(panel_brightness, 0.5)
		set(AP_marks, 1)
		set(AP_panel, 1)
		set(pedestal_marks, 1)
		set(pedestal_panel, 1)
	end
	
end

local switcher_pushed = false
local btn_click = loadSample('Custom Sounds/plastic_btn.wav')

components = {

    rotary {
        -- image = rotaryImage;
        value = left_panel_gau_rotary;
        step = 0.1;
        position = { 1542, 471, 18, 18 };

        -- round inches hg to millimeters hg
        adjuster = function(v)
            if v > 1 then v = 1
			elseif v < 0 then v = 0 end
			return v
        end;
    };

    rotary {
        -- image = rotaryImage;
        value = left_map_rotary;
        step = 0.1;
        position = { 1563, 471, 18, 18 };

        -- round inches hg to millimeters hg
        adjuster = function(v)
            if v > 1 then v = 1
			elseif v < 0 then v = 0 end
			return v
        end;
    };

    rotary {
        -- image = rotaryImage;
        value = left_panel_rotary;
        step = 0.1;
        position = { 1533, 493, 18, 18 };

        -- round inches hg to millimeters hg
        adjuster = function(v)
            if v > 1 then v = 1
			elseif v < 0 then v = 0 end
			return v
        end;
    };

    rotary {
        -- image = rotaryImage;
        value = right_panel_gau_rotary;
        step = 0.1;
        position = { 1610, 471, 18, 18 };

        -- round inches hg to millimeters hg
        adjuster = function(v)
            if v > 1 then v = 1
			elseif v < 0 then v = 0 end
			return v
        end;
    };

    rotary {
        -- image = rotaryImage;
        value = right_map_rotary;
        step = 0.1;
        position = { 1587, 471, 18, 18 };

        -- round inches hg to millimeters hg
        adjuster = function(v)
            if v > 1 then v = 1
			elseif v < 0 then v = 0 end
			return v
        end;
    };

    rotary {
        -- image = rotaryImage;
        value = right_panel_rotary;
        step = 0.1;
        position = { 1554, 493, 18, 18 };

        -- round inches hg to millimeters hg
        adjuster = function(v)
            if v > 1 then v = 1
			elseif v < 0 then v = 0 end
			return v
        end;
    };

    rotary {
        -- image = rotaryImage;
        value = AP_marks_rotary;
        step = 0.1;
        position = { 1536, 638, 33, 16 };

        -- round inches hg to millimeters hg
        adjuster = function(v)
            if v > 1 then v = 1
			elseif v < 0 then v = 0 end
			return v
        end;
    };

    rotary {
        -- image = rotaryImage;
        value = AP_panel_rotary;
        step = 0.1;
        position = { 1536, 654, 33, 16 };

        -- round inches hg to millimeters hg
        adjuster = function(v)
            if v > 1 then v = 1
			elseif v < 0 then v = 0 end
			return v
        end;
    };
	
    rotary {
        -- image = rotaryImage;
        value = pedestal_marks_rotary;
        step = 0.1;
        position = { 1573, 638, 33, 16 };

        -- round inches hg to millimeters hg
        adjuster = function(v)
            if v > 1 then v = 1
			elseif v < 0 then v = 0 end
			return v
        end;
    };

    rotary {
        -- image = rotaryImage;
        value = pedestal_panel_rotary;
        step = 0.1;
        position = { 1573, 654, 33, 16 };

        -- round inches hg to millimeters hg
        adjuster = function(v)
            if v > 1 then v = 1
			elseif v < 0 then v = 0 end
			return v
        end;
    };	

    rotary {
        -- image = rotaryImage;
        value = circuit_br_marks_rotary;
        step = 0.1;
        position = { 1625, 600, 34, 34 };

        -- round inches hg to millimeters hg
        adjuster = function(v)
            if v > 1 then v = 1
			elseif v < 0 then v = 0 end
			return v
        end;
    };

    rotary {
        -- image = rotaryImage;
        value = overhead_marks_rotary;
        step = 0.1;
        position = { 1663, 600, 34, 34 };

        -- round inches hg to millimeters hg
        adjuster = function(v)
            if v > 1 then v = 1
			elseif v < 0 then v = 0 end
			return v
        end;
    };
	
    rotary {
        -- image = rotaryImage;
        value = cabin_flood_rotary;
        step = 0.1;
        position = { 1699, 600, 34, 34 };

        -- round inches hg to millimeters hg
        adjuster = function(v)
            if v > 1 then v = 1
			elseif v < 0 then v = 0 end
			return v
        end;
    };
	
    rotary {
        -- image = rotaryImage;
        value = backpanel_rotary;
        step = 0.1;
        position = { 1911, 550, 35, 35 };

        -- round inches hg to millimeters hg
        adjuster = function(v)
            if v > 1 then v = 1
			elseif v < 0 then v = 0 end
			return v
        end;
    };
	
	-- LT OVRD button
    switch {
        position = {322, 242, 76, 76},
        state = function()
            return get(lt_ovrd_button) ~= 0
        end,
        --btnOn = get(tmb_up),
        --btnOff = get(tmb_dn),
        onMouseClick = function()
            if not switcher_pushed then
				playSample(btn_click, 0)
				if get(lt_ovrd_button) ~= 0 then
					set(lt_ovrd_button, 0)
				else
					set(lt_ovrd_button, 1)
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



