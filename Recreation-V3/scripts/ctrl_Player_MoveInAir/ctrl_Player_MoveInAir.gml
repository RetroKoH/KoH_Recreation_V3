function ctrl_Player_MoveInAir(){
	var _dir = (cINPUT.k_r_h - cINPUT.k_l_h);	// Movement based on key control.

	// If pressing left
	if _dir == -1 {
	    flipped = true;		// Player is now facing right.
	    if xsp >- topspeed	// If the character is moving slower than max speed to the left
	    {
	        xsp -= accel_run * 2;	// Accelerate to the left.
	        if xsp <- topspeed
				xsp = -topspeed;	// ONLY IF the character was moving slower than max speed to the left, set speed to max if it exceeds max.
	    }
	}

	// If pressing right
	if _dir == 1 {
	    flipped = false;	// Player is now facing right.
	    if xsp < topspeed	// If the character is moving slower than max speed to the right
	    {
	        xsp += accel_run * 2;	// accelerate to the right.
	        if xsp > topspeed
				xsp = topspeed;		// ONLY IF the character was moving slower than max speed to the right, set speed to max if it exceeds max.
	    }
	}

	// Air drag
	if (ysp < 0 and ysp > -4)
		xsp -= floor(xsp / 0.125) / 256;
}