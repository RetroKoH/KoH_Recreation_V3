// Database of sprite animations for the ring object
function animtable_RINGS(){
	global.AnimTable_Rings = [];
	// ==================================================================================

	setup_Animation(global.AnimTable_Rings, "Spinning", spr_Ring, spr_Ring, spr_Ring, -1, -1, 0, -1);

	var _sp = 1/4;
	for (var _i = 0; _i < 8; _i++)
		setup_AnimationFrame(global.AnimTable_Rings, _i, _sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_Rings, "Sparkle", spr_RingSparkle, spr_RingSparkle, spr_RingSparkle, -1, 0, 0, -1);
	
	_sp = 1/6;
	for (var _i = 0; _i < 3; _i++)
		setup_AnimationFrame(global.AnimTable_Rings, _i, _sp);
	setup_AnimationFrame(global.AnimTable_Rings, 3, 1/7);
	// ==================================================================================

	array_push(global.AnimsIndex, global.AnimTable_Rings);
}