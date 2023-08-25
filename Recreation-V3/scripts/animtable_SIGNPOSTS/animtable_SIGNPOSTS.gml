// Database of sprite animations for the signpost object
function animtable_SIGNPOSTS(){
	global.AnimTable_Signpost = [];
	// ==================================================================================

	setup_Animation(global.AnimTable_Signpost, "Eggman", spr_Signpost, spr_Signpost, spr_Signpost, -1, -1, 0, -1);

	setup_AnimationFrame(global.AnimTable_Signpost, 0, 1);
	// ==================================================================================

	setup_Animation(global.AnimTable_Signpost, "Spin #1", spr_Signpost, spr_Signpost, spr_Signpost, -1, -1, 0, -1);

	var _sp = 1/2;
	for (var _i = 0; _i < 4; _i++)
		setup_AnimationFrame(global.AnimTable_Signpost, _i, _sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_Signpost, "Spin #2", spr_Signpost, spr_Signpost, spr_Signpost, -1, -1, 0, -1);

	setup_AnimationFrame(global.AnimTable_Signpost, 4, _sp);
	for (var _i = 1; _i < 4; _i++)
		setup_AnimationFrame(global.AnimTable_Signpost, _i, _sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_Signpost, "Player", spr_Signpost, spr_Signpost, spr_Signpost, -1, -1, 0, -1);

	setup_AnimationFrame(global.AnimTable_Signpost, 4, 1);
	// ==================================================================================

	array_push(global.AnimsIndex, global.AnimTable_Signpost);
}