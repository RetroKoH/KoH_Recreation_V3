// Database of sprite animations for the ring object
function animtable_RINGS(){
	global.AnimTable_Rings = [];
	// ==================================================================================

	setup_Animation(global.AnimTable_Rings, "Spinning", spr_Ring, spr_Ring, spr_Ring, -1, -1, 0, -1);

	var sp = 1/4;
	for (var i = 0; i < 8; i++)
		setup_AnimationFrame(global.AnimTable_Rings, i, sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_Rings, "Sparkle", spr_Ring, spr_Ring, spr_Ring, -1, -1, 0, -1);
	
	sp=1/6;
	for (var i = 0; i < 3; i++)
		setup_AnimationFrame(global.AnimTable_Rings, 8+i, sp);
	setup_AnimationFrame(global.AnimTable_Rings, 11, 1/7);
	// ==================================================================================

	array_push(global.AnimsIndex, global.AnimTable_Rings);
}