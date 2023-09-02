function ctrl_Tails_Flight() {
	ctrl_Tails_MoveFlight();			// Flight control
	ctrl_Player_MoveInAir();			// Move through the air and apply air drag.
	ctrl_Player_LevelBound();			// Interactions with camera planes
	gfunc_gameobj_apply_speed(false);	// SpeedToPos
	ctrl_Player_ResetAngle(angle);		// Reset angle
	ctrl_Player_CheckFloor();			// Floor sensor collision check (and walls)
}

function ctrl_Tails_MoveFlight() {
	if (double_jump_property) double_jump_property--;	// Decrement timer
	// Flight Control

	// Tails_Fly_WaitforInput
	if (double_jump_flag == 1) {
		if (cINPUT.k_abc_p) and (ysp >= -1) and (double_jump_property)
			double_jump_flag = 2;	// Set to 2
		ysp += 0.03125;				// Flight Gravity
	}

	// Tails_FlyHeight
	else {
		if (ysp < -1) double_jump_flag--; // if Tails is faster than $100 upwards, stop ascending
		else {
			ysp -= 0.125;
			double_jump_flag++;
			if (double_jump_flag == $20)
				double_jump_flag = 1; // if Tails reaches $20, he must stop ascending
		}
	}

	// Tails_FlyCamera
	ctrl_Tails_SetFlightAnim();
	
	// Flight Cancel
	if cINPUT.k_d_h and cINPUT.k_abc_p {
		// Stop sounds
		gfunc_audio_sfx_play(SFXs.FLYING);
		gfunc_audio_sfx_play(SFXs.FLY_TIRED);
		
		// Update collision radiuses and shift camera
		width		= WIDTH_ROLL;
		height		= HEIGHT_ROLL;
		//cCAMERA.view_y += height_def - width;
		
		// Set flags
		double_jump_flag	= -1;		// -1 - Cannot re-enter Fly state
		spinning			= true;
		anim_ID				= ANI_PLAYER.ROLL;
	}
}