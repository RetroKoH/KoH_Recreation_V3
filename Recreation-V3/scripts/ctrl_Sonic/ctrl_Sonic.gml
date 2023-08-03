function ctrl_Sonic() {
	if (in_air)
		ctrl_Sonic_InAir();
	else {
		if (spinning)
			ctrl_Sonic_Rolling();
		else
			ctrl_Sonic_Normal();
	}
}

function ctrl_Sonic_Normal() {
//	if ctrl_Sonic_Peelout()		exit;	// *** Check for starting a peelout.
//	if ctrl_Player_Spindash()	exit;	// *** Check for starting a spin dash.
//	if ctrl_Player_Jump()		exit;	// *** Check for starting a jump.
//	ctrl_Player_SlopeResist();			// Adjust inertia based on collision angle.
	ctrl_Player_MoveGround();			// Move along the ground and apply friction/deceleration.
//	ctrl_Player_Roll();					// Check for starting a roll.
//	ctrl_Player_LevelBound();			// Interact with screen boundaries.
	gfunc_gameobj_apply_speed(false);	// Apply speed without gravity.
//	ctrl_Player_AnglePos();				// Floor collision and angle check occurs.
//	ctrl_Player_SlopeRepel();			// Push down slopes and fall from loops.
}

function ctrl_Sonic_Rolling() {
}

function ctrl_Sonic_InAir() {
}