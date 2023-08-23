// Database of sprite animations for the lamppost object
function animtable_LAMPPOSTS(){
	global.AnimTable_Lamppost = [];
	// ==================================================================================

	setup_Animation(global.AnimTable_Lamppost, "Inactive", spr_Lamppost, spr_Lamppost, spr_Lamppost, -1, -1, 0, -1);

	setup_AnimationFrame(global.AnimTable_Lamppost, 0, 1);
	// ==================================================================================

	setup_Animation(global.AnimTable_Lamppost, "Twirling", spr_Lamppost, spr_Lamppost, spr_Lamppost, -1, 0, 0, 2);

	for (var _i = 1; _i < 16; _i++)
		setup_AnimationFrame(global.AnimTable_Lamppost, _i, 1);
	// ==================================================================================

	setup_Animation(global.AnimTable_Lamppost, "Activated", spr_Lamppost, spr_Lamppost, spr_Lamppost, -1, 0, 0, 2);

	var _sp = 1/4;
	setup_AnimationFrame(global.AnimTable_Lamppost, 16, _sp);
	setup_AnimationFrame(global.AnimTable_Lamppost, 17, _sp);
	// ==================================================================================

	array_push(global.AnimsIndex, global.AnimTable_Lamppost);
}