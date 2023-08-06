function ctrl_Player_MoveRoll(){
	var roll_fric = accel_run / 2;
	var _sign = sign(inertia);
	
	if !move_lock {
		var _dir = (cINPUT.k_r_h - cINPUT.k_l_h);	// Movement based on directional input.
		
		if _dir == -1 {		// is left being pressed?
			if inertia > 0
				inertia = max(inertia - 0.125, 0); // inertia = (inertia >= 0.125) ? inertia - 0.125 : 0;
			else {
				flipped = true;
				pushing = false;
			}
	    }
	    else if _dir == 1 {	// is right being pressed?
			if inertia < 0
				inertia = min(inertia + 0.125, 0); // inertia = (inertia <= -0.125) ? inertia + 0.125 : 0;
			else {
				flipped = false;
				pushing = false;
			}
	    }

		// The following is applied constantly throughout rolling.
		if inertia < 0
			inertia = min(inertia + roll_fric, 0);	// Friction when rolling left: (inertia <= -roll_fric) ? inertia + roll_fric : 0;
		else if inertia > 0
			inertia = max(inertia - roll_fric, 0);	// Friction when rolling right: (inertia >= roll_fric) ? inertia - roll_fric : 0;
	        
		// Unrolling
		if !forced_roll {
			if abs(inertia) < 0.5 {
				spinning	= false;
				y			-= height_def - height;
				height		= height_def;
				width		= WIDTH_MAIN;
				anim_ID		= ANI_PLAYER.IDLE;
			}
		}
		else if inertia == 0
			inertia = 2 * _sign;	// Forced speed increase.
	}
	
	// Apply to x and y speeds using the acquired gsp. Rolling has a speed cap of 16 pixels/step.
	ysp = inertia * -global.angle_data[angle].sine;
	var xv = inertia * global.angle_data[angle].cosine;
	if xv > 16		xsp = 16;
	else if xv<-16	xsp = -16;
	else			xsp = xv;
}