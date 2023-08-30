function animtable_PLAYERS() {
	enum ANI_PLAYER {
		IDLE,
		WALK,
		JOG,
		RUN,
		DASH,
		SPINDASH,
		LOOK_UP,
		DUCK,
		ROLL,
		SKID,
		BALANCE,
		BALANCE_2,
		PUSH,
		SPRING,
		FALL,
		// SLIDE,
		HURT,
		DEATH,
		DROWN,
		
		// Unique character ability-related animations
		PEELOUT,
		DROPDASH,
		FLY,
		FLY_FAST,
		FLY_TIRED,
		SWIM,
		SWIM_UP,
		SWIM_TIRED,
		GLIDE,
		SLIDE,
		LANDING,
		GETUP,
		CLIMB,
		CLAMBERING,
		HAMMERJUMP_IDLE,
		HAMMERJUMP_RUN,
		HAMMER_HOVER,
		DRILLDIVE,
		AIRUP,
		AIRDOWN,
		TOTAL // Used for final count below
	}
	
	// Anim Tables
	animtable_SONIC();
	animtable_TAILS();
}

// Database of sprite animations for Sonic
function animtable_SONIC() {
	global.AnimTable_PlayerSonic = [];
	// ==================================================================================
	
	setup_Animation(global.AnimTable_PlayerSonic, "Idle", spr_sonic_idle, spr_sonic_mask, spr_sonic_maskL, -1, -1, 16, -1);
	
	var sp = 1/24;
	repeat(12) setup_AnimationFrame(global.AnimTable_PlayerSonic, 0, sp);
	setup_AnimationFrame(global.AnimTable_PlayerSonic, 2, sp);
	repeat(3) setup_AnimationFrame(global.AnimTable_PlayerSonic, 1, sp);
	setup_AnimationFrame(global.AnimTable_PlayerSonic, 2, sp);
	setup_AnimationFrame(global.AnimTable_PlayerSonic, 3, sp);
	// ==================================================================================
	
	setup_Animation(global.AnimTable_PlayerSonic, "Walk", spr_sonic_walk, spr_sonic_mask, spr_sonic_maskL, -1, -1, 0, -1);

	for (var i = 0; i < 12; i++)
		setup_AnimationFrame(global.AnimTable_PlayerSonic, i, 1);
	// ==================================================================================
	
	setup_Animation(global.AnimTable_PlayerSonic, "Jog", spr_sonic_jog, spr_sonic_mask, spr_sonic_maskL, -1, -1, 0, -1);

	for (var i = 0; i < 10; i++)
		setup_AnimationFrame(global.AnimTable_PlayerSonic, i, 1);
	// ==================================================================================
	
	setup_Animation(global.AnimTable_PlayerSonic, "Run", spr_sonic_run, spr_sonic_mask, spr_sonic_maskL, -1, -1, 0, -1);

	for (var i = 0; i < 8; i++)
		setup_AnimationFrame(global.AnimTable_PlayerSonic, i, 1);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerSonic, "Dash", spr_sonic_dash, spr_sonic_mask, spr_sonic_maskL, -1, -1, 0, -1);

	for (var i = 0; i < 4; i++)
		setup_AnimationFrame(global.AnimTable_PlayerSonic, i, 1);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerSonic, "Spin Dash", spr_sonic_spindash, spr_spin_mask, spr_spin_maskL, -1, -1, 0, -1);

	for (var i = 0; i < 5; i++)
		setup_AnimationFrame(global.AnimTable_PlayerSonic, i, 1);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerSonic, "Look Up", spr_sonic_lookup, spr_sonic_mask, spr_sonic_maskL, -1, -1, 1, -1);

	sp = 1/2;
	setup_AnimationFrame(global.AnimTable_PlayerSonic, 0, sp);
	setup_AnimationFrame(global.AnimTable_PlayerSonic, 1, sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerSonic, "Duck", spr_sonic_duck, spr_duck_mask, spr_duck_mask, -1, -1, 1, -1);

	setup_AnimationFrame(global.AnimTable_PlayerSonic, 0, sp);
	setup_AnimationFrame(global.AnimTable_PlayerSonic, 1, sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerSonic, "Roll", spr_sonic_roll, spr_spin_mask, spr_spin_mask, -1, -1, 0, -1);

	for (var i = 0; i < 4; i++) {
		setup_AnimationFrame(global.AnimTable_PlayerSonic, 8, 1);
		setup_AnimationFrame(global.AnimTable_PlayerSonic, 9, 1);
		setup_AnimationFrame(global.AnimTable_PlayerSonic, i*2, 1);
		setup_AnimationFrame(global.AnimTable_PlayerSonic, i*2 + 1, 1);
	}
	// ==================================================================================
	
	setup_Animation(global.AnimTable_PlayerSonic, "Skid", spr_sonic_skid, spr_sonic_mask, spr_sonic_mask, -1, -1, 4, -1);

	sp = 1/4;
	for (var i = 0; i < 6; i++)
		setup_AnimationFrame(global.AnimTable_PlayerSonic, i, sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerSonic, "Balance", spr_sonic_balance, spr_sonic_mask, spr_sonic_mask, -1, -1, 0, -1);

	sp = 1/12;
	for (var i = 0; i < 4; i++)
		setup_AnimationFrame(global.AnimTable_PlayerSonic, i, sp);
	// ==================================================================================
	
	setup_Animation(global.AnimTable_PlayerSonic, "Balance Flip", spr_sonic_balance_flip, spr_sonic_mask, spr_sonic_mask, -1, -1, 0, -1);

	for (var i = 0; i < 4; i++)
		setup_AnimationFrame(global.AnimTable_PlayerSonic, i, sp);
	// ==================================================================================
	setup_Animation(global.AnimTable_PlayerSonic, "Push", spr_sonic_push, spr_sonic_mask, spr_sonic_mask, -1, -1, 0, -1);

	sp = 1/16;
	for (var i = 0; i < 8; i++)
		setup_AnimationFrame(global.AnimTable_PlayerSonic, i, sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerSonic, "Spring", spr_sonic_spring, spr_sonic_mask, spr_sonic_mask, -1, -1, 0, -1);
	
	setup_AnimationFrame(global.AnimTable_PlayerSonic, 0, 1);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerSonic, "Fall", spr_sonic_fall, spr_sonic_mask, spr_sonic_mask, -1, -1, 0, -1);

	sp = 1/4;
	for (var i = 0; i < 3; i++)
		setup_AnimationFrame(global.AnimTable_PlayerSonic, i, sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerSonic, "Hurt", spr_sonic_hurt, spr_sonic_mask, spr_sonic_mask, -1, -1, 0, -1);
	
	setup_AnimationFrame(global.AnimTable_PlayerSonic, 0, 1);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerSonic, "Death", spr_sonic_death, spr_sonic_mask, spr_sonic_mask, -1, -1, 0, -1);
	
	setup_AnimationFrame(global.AnimTable_PlayerSonic, 0, 1);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerSonic, "Drown", spr_sonic_death, spr_sonic_mask, spr_sonic_mask, -1, -1, 0, -1);
	
	setup_AnimationFrame(global.AnimTable_PlayerSonic, 1, 1);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerSonic, "Peelout", spr_sonic_peelout, spr_sonic_mask, spr_sonic_maskL, -1, -1, 14, -1);

	sp = 1/4;
	setup_AnimationFrame(global.AnimTable_PlayerSonic, 0, 1/6);
	setup_AnimationFrame(global.AnimTable_PlayerSonic, 1, sp);	sp = 1/2;
	setup_AnimationFrame(global.AnimTable_PlayerSonic, 2, sp);
	setup_AnimationFrame(global.AnimTable_PlayerSonic, 3, sp);
	for (var i = 4; i < 18; i++)
		setup_AnimationFrame(global.AnimTable_PlayerSonic, i, 1);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerSonic, "Drop Dash", spr_sonic_dropdash, spr_spin_mask, spr_spin_maskL, -1, -1, 0, -1);

	sp = 1/2;
	for (var i = 0; i < 6; i++) {
		setup_AnimationFrame(global.AnimTable_PlayerSonic, i mod 2, sp);
		setup_AnimationFrame(global.AnimTable_PlayerSonic, i+2, sp);
	}
	setup_AnimationFrame(global.AnimTable_PlayerSonic, 1, sp);
	// ==================================================================================
	
	array_push(global.AnimsIndex, global.AnimTable_PlayerSonic);
}

// Database of sprite animations for Tails
function animtable_TAILS() {
	global.AnimTable_PlayerTails = [];
	// ==================================================================================
	
	setup_Animation(global.AnimTable_PlayerTails, "Idle", spr_tails_idle, spr_tails_mask, spr_tails_maskL, -1, -1, 16, -1);
	
	var sp = 1/8, sp_2 = 1/72, sp_3 = 1/128;
	repeat(2) {	// Tails is standing and blinking.
		setup_AnimationFrame(global.AnimTable_PlayerTails, 0, sp_2);	// Tails will stand still for roughly 4 seconds. He blinks twice before waiting.
		setup_AnimationFrame(global.AnimTable_PlayerTails, 1, sp);
		setup_AnimationFrame(global.AnimTable_PlayerTails, 2, sp);
	}
	setup_AnimationFrame(global.AnimTable_PlayerTails, 0, sp_2);		// Tails goes back to standing for a short time, before looking at you.
	repeat(3) {
		// 13 frames each
		setup_AnimationFrame(global.AnimTable_PlayerTails, 3, sp_3);	// #7 - Staring at you
		setup_AnimationFrame(global.AnimTable_PlayerTails, 4, sp);
		repeat(5) {
			// Tails is yawning.
			setup_AnimationFrame(global.AnimTable_PlayerTails, 5, sp);
			setup_AnimationFrame(global.AnimTable_PlayerTails, 6, sp);
		}
		setup_AnimationFrame(global.AnimTable_PlayerTails, 4, sp);
	}
	setup_AnimationFrame(global.AnimTable_PlayerTails, 7, sp_3);		// #40 - Staring at you, annoyed
	setup_AnimationFrame(global.AnimTable_PlayerTails, 8, sp);
	repeat(2) {
		// Tails is sitting and blinking.
		setup_AnimationFrame(global.AnimTable_PlayerTails, 9, sp_2);
		setup_AnimationFrame(global.AnimTable_PlayerTails, 10, sp);
		setup_AnimationFrame(global.AnimTable_PlayerTails, 11, sp);
	}
	setup_AnimationFrame(global.AnimTable_PlayerTails, 9, sp_2);		// #48 - Sitting bored (Loop point)
	setup_AnimationFrame(global.AnimTable_PlayerTails, 12, sp);
	repeat(5) {
		setup_AnimationFrame(global.AnimTable_PlayerTails, 13, sp);
		setup_AnimationFrame(global.AnimTable_PlayerTails, 14, sp);
	}
	setup_AnimationFrame(global.AnimTable_PlayerTails, 12, sp);
	// ==================================================================================
	
	setup_Animation(global.AnimTable_PlayerTails, "Walk", spr_tails_walk, spr_tails_mask, spr_tails_maskL, -1, -1, 0, -1);

	for (var i = 0; i < 8; i++)
		setup_AnimationFrame(global.AnimTable_PlayerTails, i, 1);
	// ==================================================================================
	
	setup_Animation(global.AnimTable_PlayerTails, "Jog", spr_tails_jog, spr_tails_mask, spr_tails_maskL, -1, -1, 0, -1);

	for (var i = 0; i < 8; i++)
		setup_AnimationFrame(global.AnimTable_PlayerTails, i, 1);
	// ==================================================================================
	
	setup_Animation(global.AnimTable_PlayerTails, "Run", spr_tails_run, spr_tails_mask, spr_tails_maskL, -1, -1, 0, -1);

	for (var i = 0; i < 8; i++)
		setup_AnimationFrame(global.AnimTable_PlayerTails, i, 1);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerTails, "Dash", spr_tails_dash, spr_tails_mask, spr_tails_maskL, -1, -1, 0, -1);

	for (var i = 0; i < 4; i++)
		setup_AnimationFrame(global.AnimTable_PlayerTails, i, 1);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerTails, "Spin Dash", spr_tails_spindash, spr_spin_mask, spr_spin_maskL, -1, -1, 0, -1);

	for (var i = 0; i < 3; i++)
		setup_AnimationFrame(global.AnimTable_PlayerTails, i, 1);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerTails, "Look Up", spr_tails_lookup, spr_tails_mask, spr_tails_maskL, -1, -1, 1, -1);

	sp = 1/2;
	setup_AnimationFrame(global.AnimTable_PlayerTails, 0, sp);
	setup_AnimationFrame(global.AnimTable_PlayerTails, 1, sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerTails, "Duck", spr_tails_duck, spr_duck_mask, spr_duck_mask, -1, -1, 1, -1);

	setup_AnimationFrame(global.AnimTable_PlayerTails, 0, sp);
	setup_AnimationFrame(global.AnimTable_PlayerTails, 1, sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerTails, "Roll", spr_tails_roll, spr_spin_mask, spr_spin_mask, -1, -1, 0, -1);

	for (var i = 0; i < 6; i++)
		setup_AnimationFrame(global.AnimTable_PlayerTails, i, 1);
	// ==================================================================================
	
	setup_Animation(global.AnimTable_PlayerTails, "Skid", spr_tails_skid, spr_tails_mask, spr_tails_mask, -1, -1, 4, -1);

	sp = 1/4;
	for (var i = 0; i < 6; i++)
		setup_AnimationFrame(global.AnimTable_PlayerTails, i, sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerTails, "Balance", spr_tails_balance, spr_tails_mask, spr_tails_mask, -1, -1, 0, -1);

	sp = 1/12;
	for (var i = 0; i < 2; i++)
		setup_AnimationFrame(global.AnimTable_PlayerTails, i, sp);
	// ==================================================================================
	
	setup_Animation(global.AnimTable_PlayerTails, "Balance Flip", spr_tails_balance_flip, spr_tails_mask, spr_tails_mask, -1, -1, 0, -1);

	for (var i = 0; i < 2; i++)
		setup_AnimationFrame(global.AnimTable_PlayerTails, i, sp);
	// ==================================================================================
	setup_Animation(global.AnimTable_PlayerTails, "Push", spr_tails_push, spr_tails_mask, spr_tails_mask, -1, -1, 0, -1);

	sp = 1/16;
	for (var i = 0; i < 4; i++)
		setup_AnimationFrame(global.AnimTable_PlayerTails, i, sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerTails, "Spring", spr_tails_spring, spr_tails_mask, spr_tails_mask, -1, -1, 0, -1);
	
	setup_AnimationFrame(global.AnimTable_PlayerTails, 0, 1);
	setup_AnimationFrame(global.AnimTable_PlayerTails, 1, 1);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerTails, "Fall", spr_tails_fall, spr_tails_mask, spr_tails_mask, -1, -1, 0, -1);

	sp = 1/4;
	for (var i = 0; i < 2; i++)
		setup_AnimationFrame(global.AnimTable_PlayerTails, i, sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerTails, "Hurt", spr_tails_hurt, spr_tails_mask, spr_tails_mask, -1, -1, 0, -1);
	
	setup_AnimationFrame(global.AnimTable_PlayerTails, 0, 1);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerTails, "Death", spr_tails_death, spr_tails_mask, spr_tails_mask, -1, -1, 0, -1);
	
	setup_AnimationFrame(global.AnimTable_PlayerTails, 0, 1);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerTails, "Drown", spr_tails_death, spr_tails_mask, spr_tails_mask, -1, -1, 0, -1);
	
	setup_AnimationFrame(global.AnimTable_PlayerTails, 1, 1);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerTails, "Peelout - NULL", spr_char_null, spr_char_null, spr_char_null, -1, -1, 0, -1);
	
	setup_AnimationFrame(global.AnimTable_PlayerTails, 0, 1);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerTails, "Drop Dash - NULL", spr_char_null, spr_char_null, spr_char_null, -1, -1, 0, -1);
	
	setup_AnimationFrame(global.AnimTable_PlayerTails, 0, 1);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerTails, "Fly", spr_tails_fly, spr_tails_mask, spr_tails_maskL, -1, -1, 0, -1);

	sp = 1/2;
	for (var i = 0; i < 2; i++)
		setup_AnimationFrame(global.AnimTable_PlayerTails, i, sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerTails, "Fly Fast", spr_tails_fly, spr_tails_mask, spr_tails_maskL, -1, -1, 0, -1);

	for (var i = 2; i < 4; i++)
		setup_AnimationFrame(global.AnimTable_PlayerTails, i, sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerTails, "Fly Tired", spr_tails_fly, spr_tails_mask, spr_tails_maskL, -1, -1, 0, -1);

	for (var i = 4; i < 8; i++)
		setup_AnimationFrame(global.AnimTable_PlayerTails, i, sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerTails, "Swim", spr_tails_swim, spr_tails_mask, spr_tails_maskL, -1, -1, 0, -1);

	for (var i = 0; i < 5; i++)
		setup_AnimationFrame(global.AnimTable_PlayerTails, i, sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerTails, "Swim Up", spr_tails_swim, spr_tails_mask, spr_tails_maskL, -1, -1, 0, -1);

	for (var i = 0; i < 5; i++)
		setup_AnimationFrame(global.AnimTable_PlayerTails, i, sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_PlayerTails, "Swim Tired", spr_tails_swim_tired, spr_tails_mask, spr_tails_maskL, -1, -1, 0, -1);

	for (var i = 0; i < 3; i++)
		setup_AnimationFrame(global.AnimTable_PlayerTails, i, sp);
	// ==================================================================================

	array_push(global.AnimsIndex, global.AnimTable_PlayerTails);
}