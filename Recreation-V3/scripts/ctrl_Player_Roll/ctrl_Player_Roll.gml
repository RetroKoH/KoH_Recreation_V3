function ctrl_Player_Roll() {
	if abs(inertia) >= 1 {		// If absolute gsp is past a certain threshold
		if !(cINPUT.k_l_h and cINPUT.k_r_h) and cINPUT.k_d_h {
		    if !(spinning) {				// If we are not already rolling
		        spinning	= true;
		        height		= HEIGHT_ROLL;
		        width		= WIDTH_ROLL;
		        anim_ID		= ANI_PLAYER.ROLL;
		        y			+= height_def - height;	// Reposition character according to height change
		        // Play roll sound
		    }
		}
	}
}