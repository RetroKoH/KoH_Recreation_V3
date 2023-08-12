function ctrl_Player_MoveRoll(){
	var _fric = accel_run / 2; //.0234375

	var _dir = (cINPUT.k_r_h - cINPUT.k_l_h);	// Movement based on key control.
	
	// If pressing left
	if _dir == -1 {
	    if inertia == 0	{
			flipped = true;
			anim_ID = ANI_PLAYER.ROLL;
		}
	    else if inertia > 0
			inertia = (inertia >= 0.125) ? inertia - 0.125 : 0;
	}

	// If pressing right
	else if _dir == 1 {
	    if inertia == 0 {
			flipped = false;
			anim_ID = ANI_PLAYER.ROLL;
		}
	    else if inertia < 0
			inertia = (inertia <= -0.125) ? inertia + 0.125 : 0;
	}

	// The following is applied constantly throughout rolling.
	if inertia < 0
		inertia = (inertia <= -_fric) ? inertia + _fric : 0;	// Friction when rolling left
	else if inertia > 0
		inertia = (inertia >= _fric) ? inertia - _fric : 0;		// Friction when rolling right
	if inertia == 0
	{
		spinning	=  false;
		y			-= height_def - height;
		height		=  height_def;
		width		=  WIDTH_MAIN;
		anim_ID		=  ANI_PLAYER.IDLE;
	}

	// Apply to x and y speeds using the acquired gsp. Rolling has a speed cap of 16 pixels/step.
	ysp		= inertia * -global.angle_data[angle].sine;
	var _xv	= inertia *	global.angle_data[angle].cosine;

	if _xv > 16		xsp = 16;
	else if _xv<-16	xsp = -16;
	else			xsp = _xv;
}