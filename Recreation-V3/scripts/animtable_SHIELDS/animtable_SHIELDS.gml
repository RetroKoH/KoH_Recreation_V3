function animtable_SHIELDS(){
	enum ANI_SHIELD {
		BLUE,		// Blue Shield
		STARS,		// Invinc Stars
		SHIELD_F,	// Flame Shield
		SHIELD_F2,	// Flame Dash
		SHIELD_F3,	// Flame Shield Dissipate (in water)
		SHIELD_L,	// Lightning Shield
		SHIELD_L2,	// Used by sparks
		SHIELD_B,	// Bubble Shield
		SHIELD_B2,	// Bubble Bounce (Called by Double Jump)
		SHIELD_B3,	// Bubble Bounce Up (Called by Reset on Floor)
		SUPER,		// Super Sonic Stars
		INSTA		// Instashield
	}
	
	global.AnimTable_Shields = [];
	var _m = spr_Shield;
	// ==================================================================================
	
	setup_Animation(global.AnimTable_Shields, "Blue Shield", spr_Shield, _m, _m, -1, -1, 0, -1);

	var _sp = 1/2;
	for (var _i = 0; _i < 3; _i++) {
		setup_AnimationFrame(global.AnimTable_Shields, _i, _sp);
		setup_AnimationFrame(global.AnimTable_Shields, 3, _sp);
	}
	// ==================================================================================

	setup_Animation(global.AnimTable_Shields, "Stars", spr_InvincStars, _m, _m, -1, -1, 0, -1);

	_sp = 1/6;
	for (var _i = 1; _i <= 3; _i++) {
		setup_AnimationFrame(global.AnimTable_Shields, _i, _sp);
		setup_AnimationFrame(global.AnimTable_Shields, 4, _sp);
	}
	// ==================================================================================
	
	setup_Animation(global.AnimTable_Shields, "Flame Shield", spr_Shield_F, _m, _m, -1, -1, 0, -1);

	_sp = 1/2;
	for (var _i = 0; _i < 18; _i++)
		setup_AnimationFrame(global.AnimTable_Shields, _i, _sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_Shields, "Flame Dash", spr_Shield_FDash, _m, _m, -1, 0, 0, ANI_SHIELD.SHIELD_F);

	for (var _i = 0; _i < 4; _i++)
		setup_AnimationFrame(global.AnimTable_Shields, _i, _sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_Shields, "Flame Dissipate", spr_Shield_FSmoke, _m, _m, -1, 0, 0, -1);

	for (var _i = 0; _i < 4; _i++)
		setup_AnimationFrame(global.AnimTable_Shields, _i, _sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_Shields, "Lightning Shield", spr_Shield_L, _m, _m, -1, -1, 0, -1);

	for (var _i = 0; _i < 9; _i++)
		repeat(2)	setup_AnimationFrame(global.AnimTable_Shields, _i, _sp);
	for (var _i = 9; _i <= $B; _i++)
					setup_AnimationFrame(global.AnimTable_Shields, _i, _sp);
	for (var _i = $16; _i > $D; _i--)
		repeat(2)	setup_AnimationFrame(global.AnimTable_Shields, _i, _sp);
	for (var _i = 9; _i <= $B; _i++)
					setup_AnimationFrame(global.AnimTable_Shields, _i, _sp);
	// ==================================================================================
	
	setup_Animation(global.AnimTable_Shields, "Lightning Spark", spr_Shield_LSpark, spr_Shield_LSpark, spr_Shield_LSpark, -1, 0, 0,-1);

	repeat(6)
		for (var _i = 0; _i < 3; _i++)
			setup_AnimationFrame(global.AnimTable_Shields, _i, 1);
	for (var _i = 0; _i < 2; _i++)
			setup_AnimationFrame(global.AnimTable_Shields, _i, 1);
	// ==================================================================================

	setup_Animation(global.AnimTable_Shields, "Bubble Shield", spr_Shield_B, _m, _m, -1, -1, 0, -1);

	for (var _i = 0; _i < 9; _i++) {
		var _a = 9 + (_i&1);
		repeat(3) {
			setup_AnimationFrame(global.AnimTable_Shields, _i, _sp);
			setup_AnimationFrame(global.AnimTable_Shields, _a, _sp);
		}
	}
	// ==================================================================================

	setup_Animation(global.AnimTable_Shields, "Bubble Bounce (Air)", spr_Shield_BDrop, _m, _m, -1, 0, 0, ANI_SHIELD.SHIELD_B);

	_sp = 1/6;
				setup_AnimationFrame(global.AnimTable_Shields, 0, _sp);
	repeat(3)	setup_AnimationFrame(global.AnimTable_Shields, 1, _sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_Shields, "Bubble Bounce (Ground)", spr_Shield_BBounce, _m, _m, -1, 0, 0, ANI_SHIELD.SHIELD_B);

	repeat(2)	setup_AnimationFrame(global.AnimTable_Shields, 0, _sp);
				setup_AnimationFrame(global.AnimTable_Shields, 1, _sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_Shields, "Super Star", spr_SuperStar, spr_SuperStar, spr_SuperStar, -1, 0, 0, -1);

	_sp = 1/4;
	for (var _i = 0; _i < 3; _i++)
		setup_AnimationFrame(global.AnimTable_Shields, _i, _sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_Shields, "Insta-Shield", spr_InstaShield, spr_InstaShield, spr_InstaShield, -1, 0, 0, -1);

	for (var _i = 0; _i < 6; _i++)
		setup_AnimationFrame(global.AnimTable_Shields, _i, 1);
	repeat(7)
		setup_AnimationFrame(global.AnimTable_Shields, 6, 1);
	setup_AnimationFrame(global.AnimTable_Shields, 7, 1);
	// ==================================================================================

	array_push(global.AnimsIndex, global.AnimTable_Shields);
}