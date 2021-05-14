-- General SASLtm Stuff --
sasl.options.setAircraftPanelRendering(false) -- Change this to true later
sasl.options.set3DRendering(false)
sasl.options.setInteractivity(false)

-- Custom Datarefs --
createGlobalPropertyf("VFS/767/Doors/Fwd_Left", 0)
createGlobalPropertyf("VFS/767/Doors/Fwd_Right", 0)
createGlobalPropertyf("VFS/767/Doors/Fwd_Cargo", 0)
createGlobalPropertyf("VFS/767/Doors/Mid_Left", 0)
createGlobalPropertyf("VFS/767/Doors/Mid_Right", 0)
createGlobalPropertyf("VFS/767/Doors/Rear_Left", 0)
createGlobalPropertyf("VFS/767/Doors/Rear_Right", 0)
createGlobalPropertyf("VFS/767/Doors/Rear_Cargo", 0)

-- Components --
components = {
	librain {},
	gearTilt {},
	doorDropdown {}
}