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

	setup_Animation(global.AnimTable_PlayerSonic, "Duck", spr_sonic_duck, spr_spin_mask, spr_spin_mask, -1, -1, 1, -1);

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