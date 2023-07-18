// Database of sprite animations for the ring object
function animtable_RINGS(){
	global.AnimTable_Rings = array_create(2);

	var sp=1/4;
	global.AnimTable_Rings[0] = {
		name		: "Spinning",
		sprite		: spr_Ring,
		mask		: spr_Ring,
		mask_l		: spr_Ring,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	for (var i = 0; i < 8; i++)
	{
		array_push(global.AnimTable_Rings[0].frames, i);
		array_push(global.AnimTable_Rings[0].speeds, sp);
	}
	// ==================================================================================

	var sp=1/6;
	global.AnimTable_Rings[1] = {
		name		: "Sparkle",
		sprite		: spr_Ring,
		mask		: spr_Ring,
		mask_l		: spr_Ring,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
		array_push(global.AnimTable_Rings[1].frames, 8);
		array_push(global.AnimTable_Rings[1].speeds, sp);
		array_push(global.AnimTable_Rings[1].frames, 9);
		array_push(global.AnimTable_Rings[1].speeds, sp);
		array_push(global.AnimTable_Rings[1].frames, 10);
		array_push(global.AnimTable_Rings[1].speeds, sp);
		array_push(global.AnimTable_Rings[1].frames, 11);
		array_push(global.AnimTable_Rings[1].speeds, 1/7);
	// ==================================================================================
	// ==================================================================================
	array_push(global.AnimsIndex, global.AnimTable_Rings);
}