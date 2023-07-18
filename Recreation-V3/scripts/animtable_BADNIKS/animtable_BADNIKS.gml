function animtable_BADNIKS(){
	animtable_BUZZBOMBER();
	animtable_CRABMEAT();
	animtable_MOTOBUG();
	animtable_NEWTRON();
}

// Database of sprite animations for the buzz bomber object
function animtable_BUZZBOMBER(){
	global.AnimTable_BuzzBomber=array_create(3);

	global.AnimTable_BuzzBomber[0] = {
		name		: "Idle",
		sprite		: spr_BuzzBomber,
		mask		: spr_BuzzBomber,
		mask_l		: spr_BuzzBomber,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
		array_push(global.AnimTable_BuzzBomber[0].frames, 0);
		array_push(global.AnimTable_BuzzBomber[0].speeds, 1);
	// ==================================================================================

	global.AnimTable_BuzzBomber[1] = {
		name		: "Moving",
		sprite		: spr_BuzzBomber,
		mask		: spr_BuzzBomber,
		mask_l		: spr_BuzzBomber,
		sub_anim	: -1, // Will use FIRE subanimation
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
		array_push(global.AnimTable_BuzzBomber[1].frames, 0);
		array_push(global.AnimTable_BuzzBomber[1].speeds, 1);
	// ==================================================================================

	var sp=1/2;
	global.AnimTable_BuzzBomber[2] = {
		name		: "Firing",
		sprite		: spr_BuzzBomber,
		mask		: spr_BuzzBomber,
		mask_l		: spr_BuzzBomber,
		sub_anim	: -1, // Will use FIRE subanimation
		loop_times	: -1,
		loop_frame	: 2,
		loop_anim	: -1,
		frames		: [ 1,  2, 3],	// Animation frames
		speeds		: [sp, sp, 1]
	}
	// Animation frames
		array_push(global.AnimTable_BuzzBomber[2].frames, 1);
		array_push(global.AnimTable_BuzzBomber[2].speeds, sp);
		array_push(global.AnimTable_BuzzBomber[2].frames, 2);
		array_push(global.AnimTable_BuzzBomber[2].speeds, sp);
		array_push(global.AnimTable_BuzzBomber[2].frames, 3);
		array_push(global.AnimTable_BuzzBomber[2].speeds, 1);
	// ==================================================================================
	// ==================================================================================
	array_push(global.AnimsIndex,global.AnimTable_BuzzBomber);
}

// Database of sprite animations for the crabmeat object
function animtable_CRABMEAT(){
	global.AnimTable_Crabmeat=array_create(3);

	global.AnimTable_Crabmeat[0] = {
		name		: "Idle",
		sprite		: spr_Crabmeat,
		mask		: spr_Crabmeat,
		mask_l		: spr_Crabmeat,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
		array_push(global.AnimTable_Crabmeat[0].frames, 0);
		array_push(global.AnimTable_Crabmeat[0].speeds, 1);
	// ==================================================================================

	var sp=1/16;
	global.AnimTable_Crabmeat[1] = {
		name		: "Moving",
		sprite		: spr_Crabmeat,
		mask		: spr_Crabmeat,
		mask_l		: spr_Crabmeat,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
		array_push(global.AnimTable_Crabmeat[1].frames, 1);
		array_push(global.AnimTable_Crabmeat[1].speeds, sp);
		array_push(global.AnimTable_Crabmeat[1].frames, 2);
		array_push(global.AnimTable_Crabmeat[1].speeds, sp);
		array_push(global.AnimTable_Crabmeat[1].frames, 0);
		array_push(global.AnimTable_Crabmeat[1].speeds, sp);
	// ==================================================================================

	var sp=1/16;
	global.AnimTable_Crabmeat[2] = {
		name		: "Firing",
		sprite		: spr_Crabmeat,
		mask		: spr_Crabmeat,
		mask_l		: spr_Crabmeat,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
		array_push(global.AnimTable_Crabmeat[2].frames, 3);
		array_push(global.AnimTable_Crabmeat[2].speeds, 1);
	// ==================================================================================
	// ==================================================================================
	array_push(global.AnimsIndex,global.AnimTable_Crabmeat);
}

// Database of sprite animations for the motobug object
function animtable_MOTOBUG(){
	global.AnimTable_Motobug=array_create(2);

	global.AnimTable_Motobug[0] = {
		name		: "Idle",
		sprite		: spr_Motobug,
		mask		: spr_Motobug,
		mask_l		: spr_Motobug,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
		array_push(global.AnimTable_Motobug[0].frames, 2);
		array_push(global.AnimTable_Motobug[0].speeds, 1);
	// ==================================================================================

	var sp=1/6;
	global.AnimTable_Motobug[1] = {
		name		: "Moving",
		sprite		: spr_Motobug,
		mask		: spr_Motobug,
		mask_l		: spr_Motobug,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
		array_push(global.AnimTable_Motobug[1].frames, 0);
		array_push(global.AnimTable_Motobug[1].speeds, sp);
		array_push(global.AnimTable_Motobug[1].frames, 1);
		array_push(global.AnimTable_Motobug[1].speeds, sp);
		array_push(global.AnimTable_Motobug[1].frames, 0);
		array_push(global.AnimTable_Motobug[1].speeds, sp);
		array_push(global.AnimTable_Motobug[1].frames, 2);
		array_push(global.AnimTable_Motobug[1].speeds, 1/7);
	// ==================================================================================
	// ==================================================================================
	array_push(global.AnimsIndex,global.AnimTable_Motobug);
}

// Database of sprite animations for the newtron object
function animtable_NEWTRON(){
	global.AnimTable_Newtron=array_create(4);
	global.AnimTable_Newtron[0] = {
		name		: "Idle",
		sprite		: spr_Newtron,
		mask		: spr_Newtron,
		mask_l		: spr_Newtron,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
		array_push(global.AnimTable_Newtron[0].frames, 0);
		array_push(global.AnimTable_Newtron[0].speeds, 1);
	// ==================================================================================

	var sp = 1/20;
	global.AnimTable_Newtron[1] = {
		name		: "Drop Down",
		sprite		: spr_Newtron,
		mask		: spr_Newtron,
		mask_l		: spr_Newtron,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 4,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
		array_push(global.AnimTable_Newtron[1].frames, 0);
		array_push(global.AnimTable_Newtron[1].speeds, sp);
		array_push(global.AnimTable_Newtron[1].frames, 0);
		array_push(global.AnimTable_Newtron[1].speeds, sp);
		array_push(global.AnimTable_Newtron[1].frames, 2);
		array_push(global.AnimTable_Newtron[1].speeds, sp);
		array_push(global.AnimTable_Newtron[1].frames, 3);
		array_push(global.AnimTable_Newtron[1].speeds, sp);
		array_push(global.AnimTable_Newtron[1].frames, 4);
		array_push(global.AnimTable_Newtron[1].speeds, sp);
	// ==================================================================================

	sp = 1/3;
	global.AnimTable_Newtron[2] = {
		name		: "Fly",
		sprite		: spr_Newtron,
		mask		: spr_Newtron,
		mask_l		: spr_Newtron,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],	// Animation frames
		speeds		: []
	}
	// Animation frames
		array_push(global.AnimTable_Newtron[2].frames, 5);
		array_push(global.AnimTable_Newtron[2].speeds, sp);
		array_push(global.AnimTable_Newtron[2].frames, 6);
		array_push(global.AnimTable_Newtron[2].speeds, sp);
	// ==================================================================================

	sp = 1/20;
	global.AnimTable_Newtron[3] = {
		name		: "Shoot",
		sprite		: spr_Newtron,
		mask		: spr_Newtron,
		mask_l		: spr_Newtron,
		sub_anim	: -1,
		loop_times	: 0,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
		repeat(3) {
			array_push(global.AnimTable_Newtron[3].frames, 0);
			array_push(global.AnimTable_Newtron[3].speeds, sp);
		}
		array_push(global.AnimTable_Newtron[3].frames, 1);
		array_push(global.AnimTable_Newtron[3].speeds, sp);
		repeat(3) {
			array_push(global.AnimTable_Newtron[3].frames, 0);
			array_push(global.AnimTable_Newtron[3].speeds, sp);
		}
	// ==================================================================================
	// ==================================================================================
	array_push(global.AnimsIndex, global.AnimTable_Newtron);
}