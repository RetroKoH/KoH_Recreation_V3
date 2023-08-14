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

	pushing	= false;		// Clear push status
	in_air	= false;		// Clear air status
	// Clear roll jump status
	jump	= false;
	// Clear chain bonus counter
	
	// Double jump handling
	if (double_jump_flag) {
		/*if (powerups&POW_BUBBLE) scr_bubble_bounce();
		else if !(powerups&POW_CHKELSHLDS) {
			if double_jump_property >= 20
				scr_drop_dash();
		}*/
		if double_jump_property >= 20
			ctrl_Sonic_DropDash();
		double_jump_flag		= false;
		double_jump_property	= 0;
	}
}

function ctrl_Sonic_DropDash(){
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