// Database of sprite animations for the monitor object
function animtable_MONITORS(){
	global.AnimTable_Monitors = [];
	// ==================================================================================

	setup_Animation(global.AnimTable_Monitors, "Active", spr_Monitor, spr_Monitor, spr_Monitor, -1, -1, 0, -1);

	var _sp = 1/2;
	for (var _i = 0; _i < 3; _i++)
		setup_AnimationFrame(global.AnimTable_Monitors, _i, _sp);
	setup_AnimationFrame(global.AnimTable_Monitors, 3, 1/4);
	// ==================================================================================

	setup_Animation(global.AnimTable_Monitors, "Broken", spr_Monitor_Destroyed, spr_Monitor_Destroyed, spr_Monitor_Destroyed, -1, -1, 0, -1);

	setup_AnimationFrame(global.AnimTable_Monitors, 0, 1);
	// ==================================================================================

	array_push(global.AnimsIndex, global.AnimTable_Monitors);
}