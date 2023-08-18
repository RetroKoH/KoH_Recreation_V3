// Database of sprite animations for the spring object
function animtable_SPRINGS(){
	global.AnimTable_Springs = [];
	// ==================================================================================

	setup_Animation(global.AnimTable_Springs, "Stationary", spr_Spring_Up_Y, spr_Spring_Up_Y, spr_Spring_Up_Y, -1, -1, 0, -1);

	setup_AnimationFrame(global.AnimTable_Springs, 0, 1);
	// ==================================================================================

	setup_Animation(global.AnimTable_Springs, "Springing", spr_Spring_Up_Y, spr_Spring_Up_Y, spr_Spring_Up_Y, -1, 0, 0, -1);

	setup_AnimationFrame(global.AnimTable_Springs, 1, 1);
	setup_AnimationFrame(global.AnimTable_Springs, 0, 1/2);
	setup_AnimationFrame(global.AnimTable_Springs, 2, 1/6);
	setup_AnimationFrame(global.AnimTable_Springs, 0, 1);
	// ==================================================================================

	array_push(global.AnimsIndex, global.AnimTable_Springs);
}