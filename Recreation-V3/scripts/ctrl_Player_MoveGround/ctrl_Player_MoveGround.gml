function ctrl_Player_MoveGround() {
	if !move_lock {
		var _dir = (cINPUT.k_r_h - cINPUT.k_l_h);	// Movement based on directional input.

		// Moving left
		if (_dir == -1)	{
			if (inertia > 0)	// If moving right?
			{
				inertia -= decel_run;	// Decelerate if moving right.
				if (global.angle_data[angle].quad_floor == COL_FLOOR) and inertia >= 4 {
					// If character is on Floor angles, and inertia is at/above 4, skid.
					if anim_ID != ANI_PLAYER.SKID {
						anim_ID = ANI_PLAYER.SKID;
						// Play Sound
					}
				}
			}
			else				// If already moving left or not moving
			{
				if !flipped					// If not facing Left
				{
					flipped = true;				// Face left, setting Facing bit
					pushing = false;			// Clear Pushing status bit
				}
				if (inertia >= -topspeed)	// If the character is moving slower than max speed to the left...
				{
					inertia -= accel_run;		// Accelerate to the left. Weight affects movement speed.
					anim_ID = ANI_PLAYER.WALK;	// Enter walking animation.
					if (inertia < -topspeed)
						inertia = -topspeed;	// ONLY IF the character was moving slower than max speed, set speed to max if it exceeds max.
				}
			}
		}

		// Moving right
		else if (_dir == 1) {	
			if (inertia < 0)	// If moving left?
			{
				inertia += decel_run;	// Decelerate if moving left.
				if (global.angle_data[angle].quad_floor == COL_FLOOR) and inertia <= -4 {
					// If character is on Floor angles, and inertia is at/above 4, skid.
					if anim_ID != ANI_PLAYER.SKID {
						anim_ID = ANI_PLAYER.SKID;
						// Play Sound
					}
				}
			}
			else				// If already moving right or not moving
			{
				if flipped					// If not facing Right
				{
				    flipped = false;			// Face right, clearing Facing bit
				    pushing = false;			// Clear Pushing status bit
				}
				if (inertia <= topspeed)	// If the character is moving slower than max speed to the right
				{
				    inertia += accel_run;		// Accelerate to the right.
				    anim_ID = ANI_PLAYER.WALK;	// Enter walking animation.
				    if (inertia > topspeed)
						inertia = topspeed;		// ONLY IF the character was moving slower than max speed, set speed to max if it exceeds max.
				}
			}
		}

		// If Sonic is on Floor angles, and not moving
		else if ((global.angle_data[angle].quad_floor == COL_FLOOR) and inertia == 0) {
			pushing = false;
			anim_ID = ANI_PLAYER.IDLE;

			// Looking up and down
			if cINPUT.k_u_h
			{
				anim_ID = ANI_PLAYER.LOOK_UP;
				// Shift Screen up
			}
			else if cINPUT.k_d_h
			{
				anim_ID = ANI_PLAYER.DUCK;
				// Shift Screen down
			}
			else
			{
				// Reset screen
				// If we were looking up, bring look shift back down.
				// If we were looking down, bring look shift back up.
			}
		}
	}

	// Friction (Formula per Sonic Retro Physics Guide)
	if (_dir == 0)
		inertia -= min(abs(inertia), accel_run) * sign(inertia);

	// Apply to x and y speeds using the acquired inertia.
	xsp = inertia *  global.angle_data[angle].cosine;
	ysp = inertia * -global.angle_data[angle].sine;
}