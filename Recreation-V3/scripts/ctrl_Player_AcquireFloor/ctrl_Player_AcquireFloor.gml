function ctrl_Player_AcquireFloor() {
	var _h = height;		// Store current height
	height=height_def;		// Reset collision box
	width=WIDTH_MAIN;

	if (spinning)			// If Sonic is spinning
	{
		spinning	= false;			// Clear spin status
		anim_ID		= ANI_PLAYER.WALK;
		y			-= height_def - _h;	// Pop y-pos out using stored height
	}

	pushing	= false;
	in_air	= false;
	// Clear roll jump status
	jump	= false;
	core_Stage.chain_combo = 0;	// Clear combo counter
	
	// Double jump handling
	if (double_jump_flag) {
		if double_jump_property >= 20
			ctrl_Sonic_DropDash();
		else if (shield == SHIELD.BUBBLE) ctrl_Sonic_BubbleBounce();

		double_jump_flag		= false;
		double_jump_property	= 0;
	}
}

function ctrl_Sonic_DropDash() {
	spinning	= true;
	height		= HEIGHT_ROLL;
	width		= WIDTH_ROLL;
	anim_ID		= ANI_PLAYER.ROLL;
	gfunc_audio_sfx_stop(SFXs.DROPDASH_REV);
	gfunc_audio_sfx_play(SFXs.DROPDASH_REL);
	y			+= height_def - height;
	var _dust	= instance_create_layer(x, y + height, "Instances", obj_DropdashDust);
	_dust.image_xscale = flipped ? -1 : 1;

	var drop_spd = 8, drop_max = 12;

	// Forward
	if sign(xsp) == anim_direction
		inertia = (inertia / 4) + (drop_spd * anim_direction);

	// Backward
	else {
		if angle = 0
			inertia = drop_spd * anim_direction
		else
			inertia = (inertia / 2) + (drop_spd * anim_direction)
	}

	inertia = clamp(inertia, -drop_max, drop_max);
}

function ctrl_Sonic_BubbleBounce() {
	var _bounce = !in_water ? 7.5 : 4;
	xsp = (inertia * angle_data.cosine - _bounce * angle_data.sine);
	ysp = (inertia * angle_data.sine - _bounce * angle_data.cosine);
	//xsp -= bounce * angle_data.sine;
	//ysp -= bounce * angle_data.cosine;
	in_air = true;
	pushing = false;
	jump = true;
	convex = false;
	height = HEIGHT_ROLL;
	width = WIDTH_ROLL;
	anim_ID = ANI_PLAYER.ROLL;
	spinning = true;
	y -= height_def - height;
	my_shield.anim_ID = ANI_SHIELD.SHIELD_B3;
	gfunc_audio_sfx_play(SFXs.SHIELD_BB2);
}