size = {512, 128}

defineProperty("pitch_sim", globalPropertyf("sim/cockpit2/gauges/indicators/pitch_electric_deg_pilot"))
defineProperty("roll_sim", globalPropertyf("sim/cockpit2/gauges/indicators/roll_electric_deg_pilot"))


defineProperty("alpha", globalPropertyf("sim/flightmodel/position/alpha"))
defineProperty("fuel_q_1", globalPropertyf("sim/flightmodel/weight/m_fuel[0]")) -- fuel quantity for tank 1
defineProperty("fuel_q_2", globalPropertyf("sim/flightmodel/weight/m_fuel[1]")) -- fuel quantity for tank 2
defineProperty("fuel_q_3", globalPropertyf("sim/flightmodel/weight/m_fuel[2]")) -- fuel quantity for tank 2

defineProperty("elevator_trim", globalPropertyf("sim/cockpit2/controls/elevator_trim")) -- sim pitch trimmer


-- engines N1
defineProperty("ENGN_N1_1", globalPropertyf("sim/flightmodel/engine/ENGN_N1_[0]"))  -- N1
defineProperty("ENGN_N1_2", globalPropertyf("sim/flightmodel/engine/ENGN_N1_[1]"))  -- N1

-- engines fuel flow
defineProperty("ENGN_FF_1", globalPropertyf("sim/flightmodel/engine/ENGN_FF_[0]"))  -- FF
defineProperty("ENGN_FF_2", globalPropertyf("sim/flightmodel/engine/ENGN_FF_[1]"))  -- FF
--[[
sim/aircraft/engine/acf_face_jet	-- compressor area in m2
sim/flightmodel/position/alpha	

sim/flightmodel/engine/ENGN_FF_
--]]

defineProperty("digitsImage", loadImage("white_digit_strip.png", 1, 0, 14, 196))

local stab_trimm = 0

function update()
set(fuel_q_1, 9300)
set(fuel_q_2, 0)
set(fuel_q_3, 9300)

stab_trimm = get(elevator_trim) * 12.24 + 2 -- recalculate stab trimm to units

end

components = {

	rectangle {
		position = {0, 0, 512, 128},
		color = {0, 0, 0, 0.6},
	},

	  digitstape {
        position = { 20, 20, 100, 30};
        image = digitsImage;
        digits = 7;
        fractional = 3;
		allowNonRound = true;
		showSign = true;
        value = function() 
            return get(pitch_sim); 
        end;
    }; 

--[[
	  digitstape {
        position = { 150, 20, 120, 30};
        image = digitsImage;
        digits = 8;
        fractional = 3;
		allowNonRound = true;
		showSign = true;
        value = function() 
            return get(roll_sim); 
        end;
    }; 
	
	  digitstape {
        position = { 20, 20, 120, 30};
        image = digitsImage;
        digits = 8;
        fractional = 3;
		allowNonRound = true;
		showSign = true;
        value = function() 
            return get(alpha); 
        end;
    }; 
   
--]]
	  digitstape {
        position = { 150, 20, 120, 30};
        image = digitsImage;
        digits = 8;
        fractional = 0;
		allowNonRound = true;
		showSign = true;
        value = function() 
            return get(ENGN_FF_1) * 3600; 
        end;
    }; 
	
	  digitstape {
        position = { 300, 20, 120, 30};
        image = digitsImage;
        digits = 8;
        fractional = 0;
		allowNonRound = true;
		showSign = true;
        value = function() 
            return get(ENGN_FF_2) * 3600; 
        end;
    }; 
 
	  digitstape {
        position = { 20, 80, 100, 30};
        image = digitsImage;
        digits = 5;
        fractional = 1;
		allowNonRound = true;
		showSign = true;
        value = function() 
            return stab_trimm
        end;
    }; 
	
	  digitstape {
        position = { 150, 80, 100, 30};
        image = digitsImage;
        digits = 5;
        fractional = 1;
		allowNonRound = true;
		showSign = true;
        value = function() 
            return get(ENGN_N1_1)
        end;
    }; 	


	  digitstape {
        position = { 300, 80, 100, 30};
        image = digitsImage;
        digits = 5;
        fractional = 1;
		allowNonRound = true;
		showSign = true;
        value = function() 
            return get(ENGN_N1_2)
        end;
    }; 
	
}