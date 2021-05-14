function toggleFWDLeftDoor()
	targetDoor = globalPropertyf("VFS/767/Doors/Fwd_Left")
	
	if get(targetDoor) == 1 then
		set(targetDoor, 0)
	else
		set(targetDoor, 1)
	end

	print(get(targetDoor))
	if get(targetDoor) == 1 then
		setMenuItemState(doors_menu, door_fwd_left, MENU_CHECKED)
	else
		setMenuItemState(doors_menu, door_fwd_left, MENU_UNCHECKED)
	end
end
function toggleFWDRightDoor()
	targetDoor = globalPropertyf("VFS/767/Doors/Fwd_Right")
	
	if get(targetDoor) == 1 then
		set(targetDoor, 0)
	else
		set(targetDoor, 1)
	end

	print(get(targetDoor))
	if get(targetDoor) == 1 then
		setMenuItemState(doors_menu, door_fwd_right, MENU_CHECKED)
	else
		setMenuItemState(doors_menu, door_fwd_right, MENU_UNCHECKED)
	end
end
function toggleFWDCargoDoor()
	targetDoor = globalPropertyf("VFS/767/Doors/Fwd_Cargo")
	
	if get(targetDoor) == 1 then
		set(targetDoor, 0)
	else
		set(targetDoor, 1)
	end

	print(get(targetDoor))
	if get(targetDoor) == 1 then
		setMenuItemState(doors_menu, door_fwd_cargo, MENU_CHECKED)
	else
		setMenuItemState(doors_menu, door_fwd_cargo, MENU_UNCHECKED)
	end
end
function toggleMIDLeftDoor()
	targetDoor = globalPropertyf("VFS/767/Doors/Mid_Left")
	
	if get(targetDoor) == 1 then
		set(targetDoor, 0)
	else
		set(targetDoor, 1)
	end

	print(get(targetDoor))
	if get(targetDoor) == 1 then
		setMenuItemState(doors_menu, door_mid_left, MENU_CHECKED)
	else
		setMenuItemState(doors_menu, door_mid_left, MENU_UNCHECKED)
	end
end
function toggleMIDRightDoor()
	targetDoor = globalPropertyf("VFS/767/Doors/Mid_Right")
	
	if get(targetDoor) == 1 then
		set(targetDoor, 0)
	else
		set(targetDoor, 1)
	end

	print(get(targetDoor))
	if get(targetDoor) == 1 then
		setMenuItemState(doors_menu, door_mid_right, MENU_CHECKED)
	else
		setMenuItemState(doors_menu, door_mid_right, MENU_UNCHECKED)
	end
end
function toggleREARLeftDoor()
	targetDoor = globalPropertyf("VFS/767/Doors/Rear_Left")
	
	if get(targetDoor) == 1 then
		set(targetDoor, 0)
	else
		set(targetDoor, 1)
	end

	print(get(targetDoor))
	if get(targetDoor) == 1 then
		setMenuItemState(doors_menu, door_rear_left, MENU_CHECKED)
	else
		setMenuItemState(doors_menu, door_rear_left, MENU_UNCHECKED)
	end
end
function toggleREARRightDoor()
	targetDoor = globalPropertyf("VFS/767/Doors/Rear_Right")
	
	if get(targetDoor) == 1 then
		set(targetDoor, 0)
	else
		set(targetDoor, 1)
	end

	print(get(targetDoor))
	if get(targetDoor) == 1 then
		setMenuItemState(doors_menu, door_rear_right, MENU_CHECKED)
	else
		setMenuItemState(doors_menu, door_rear_right, MENU_UNCHECKED)
	end
end
function toggleREARCargoDoor()
	targetDoor = globalPropertyf("VFS/767/Doors/Rear_Cargo")
	
	if get(targetDoor) == 1 then
		set(targetDoor, 0)
	else
		set(targetDoor, 1)
	end

	print(get(targetDoor))
	if get(targetDoor) == 1 then
		setMenuItemState(doors_menu, door_rear_cargo, MENU_CHECKED)
	else
		setMenuItemState(doors_menu, door_rear_cargo, MENU_UNCHECKED)
	end
end

--[[
	Custom_slider_ratio[1]   Front Left Door
	Custom_slider_ratio[2]   Front Right Door
	Custom_slider_ratio[7]   Front Left Cargo Door
	Custom_slider_ratio[4]   Mid Right Door
	Custom_slider_ratio[3]   Mid Left Door
	Custom_slider_ratio[5]   Rear Left Door
	Custom_slider_ratio[6]   Rear Right Door
	Custom_slider_ratio[8]   Rear Right Cargo Door
]]

button_tl = sasl.appendMenuItem(PLUGINS_MENU_ID, "767 Doors")	
doors_menu = sasl.createMenu("", PLUGINS_MENU_ID, button_tl)

door_fwd_left = sasl.appendMenuItem(doors_menu, "FWD Left Door", toggleFWDLeftDoor)
door_fwd_right = sasl.appendMenuItem(doors_menu, "FWD Right Door", toggleFWDRightDoor)
door_fwd_cargo = sasl.appendMenuItem(doors_menu, "FWD Cargo Door", toggleFWDCargoDoor)

sasl.appendMenuSeparator(doors_menu)	
door_mid_left = sasl.appendMenuItem(doors_menu, "MID Left Door", toggleMIDLeftDoor)
door_mid_right = sasl.appendMenuItem(doors_menu, "MID Right Door", toggleMIDRightDoor)

sasl.appendMenuSeparator(doors_menu)	
door_rear_left = sasl.appendMenuItem(doors_menu, "REAR Left Door", toggleREARLeftDoor)
door_rear_right = sasl.appendMenuItem(doors_menu, "REAR Right Door", toggleREARRightDoor)
door_rear_cargo = sasl.appendMenuItem(doors_menu, "REAR Cargo Door", toggleREARCargoDoor)