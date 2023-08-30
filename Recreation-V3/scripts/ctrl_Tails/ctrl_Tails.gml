function ctrl_Tails() {
	angle_data = global.angle_data[angle];
	
	if (in_air)
		ctrl_Tails_InAir();
	else {
		if (spinning)
			ctrl_Tails_Rolling();
		else
			ctrl_Tails_Normal();
	}
}

function ctrl_Tails_Normal() {
	if ctrl_Player_Spindash()	exit;	// *** Check for revving a spin dash.
	if ctrl_Player_Jump()		exit;	// *** Check for starting a jump.
	ctrl_Player_SlopeResist(false);		// Adjust inertia based on collision angle.
	ctrl_Player_MoveGround();			// Move along the ground and apply friction/deceleration.
	ctrl_Player_Balance();				// Check for balancing
	ctrl_Player_Roll();					// Check for starting a roll.
	ctrl_Player_LevelBound();			// Interact with screen boundaries.
	gfunc_gameobj_apply_speed(false);	// Apply speed without gravity.
	ctrl_Player_CheckWallsOnGround();	// Check for walls along the ground. (Moved to here to circumvent jittering bug)
	ctrl_Player_AnglePos();				// Floor collision and angle check occurs.
	ctrl_Player_SlopeRepel();			// Push down slopes and fall from loops.
}

function ctrl_Tails_Rolling() {
	if ctrl_Player_Jump()		exit;	// *** Check for starting a jump.
	ctrl_Player_SlopeResist(true);		// Adjust inertia based on collision angle.
	ctrl_Player_MoveRoll();				// Roll along the ground and apply friction.
	ctrl_Player_LevelBound();			// Interact with screen boundaries.
	gfunc_gameobj_apply_speed(false);	// Apply speed without gravity.
	ctrl_Player_CheckWallsOnGround();	// Check for walls along the ground. (Moved to here to circumvent jittering bug)
	ctrl_Player_AnglePos();				// Floor collision and angle check occurs.
	ctrl_Player_SlopeRepel();			// Push down slopes and fall from loops.
}

function ctrl_Tails_InAir() {
	// *** Run a separate mode for flight
	if double_jump_flag {
		ctrl_Tails_Flight()
		exit;
	}
	// Else
	ctrl_Player_JumpHeight();			// Check jump height and cap air velocity
	ctrl_Player_MoveInAir();			// Move through the air and apply air drag.
	ctrl_Player_LevelBound();			// Interact with screen boundaries.
	gfunc_gameobj_apply_speed(true);	// Apply speed with gravity.
	if (in_water) ysp -= .15625;		// Underwater gravity (Integrate with ObjectFall)
	ctrl_Player_ResetAngle(angle);		// Reset angle in mid-air
	ctrl_Player_CheckFloor();			// Floor sensor collision check (and walls)
}