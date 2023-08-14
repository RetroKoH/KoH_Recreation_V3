function ctrl_Player_MoveGround(){
	var _dir = (cINPUT.k_r_h - cINPUT.k_l_h) * (move_lock == 0);	// Movement based on key control.
	
	// If pressing left
	if _dir == -1 {
		if (inertia > 0) {				// If moving right?
			inertia -= decel_run;		// Decelerate if moving right.
			if (angle_data.quad_floor == 0) and inertia >= 4 {
				// If character is on Floor angles, and inertia is at/above 4, skid.
				if anim_ID != ANI_PLAYER.SKID {
					anim_ID = ANI_PLAYER.SKID;
					gfunc_audio_sfx_play(SFXs.SKID);
				}
			}
		}
		else {	// If already moving left or not moving
			if !flipped {
				// If not facing left
				flipped = true;		// Player is now facing left.
				pushing = false;	// Player is not pushing.
			}
			if (inertia >= -topspeed) {
				// If the character is moving slower than max speed to the left...
				inertia -= accel_run;		// Accelerate to the left.
				anim_ID = ANI_PLAYER.WALK;
				if inertia < -topspeed
					inertia = -topspeed;	// ONLY IF the character was moving slower than max speed, set speed to max if it exceeds max.
			}
		}
	}
	
	// If pressing right
	else if _dir == 1 {
		if (inertia < 0) { 				// If moving left?
			inertia += decel_run;		// Decelerate if moving left.
			if (angle_data.quad_floor == 0) and inertia <= -4 {
				// If character is on Floor angles, and GSP is at/above 4, skid.
				if anim_ID != ANI_PLAYER.SKID {
					anim_ID = ANI_PLAYER.SKID;
					gfunc_audio_sfx_play(SFXs.SKID);
				}
			}
		}
		else {	// If already moving right or not moving
			if flipped {
				// If not facing right
				flipped = false;	// Player is now facing right.
				pushing = false;	// Player is not pushing.
			}
			if (inertia <= topspeed) {
				// If the character is moving slower than max speed to the right...
				inertia += accel_run;		// Accelerate to the right.
				anim_ID = ANI_PLAYER.WALK;
				if inertia > topspeed
					inertia = topspeed;		// ONLY IF the character was moving slower than max speed, set speed to max if it exceeds max.
			}
		}
	}

	// If idle on flat ground
	else if (angle_data.quad_floor == 0) and inertia == 0 {
		pushing = false;			// Player is not pushing.
		anim_ID = ANI_PLAYER.IDLE;	// Set idle animation.
		
		// Looking up and down (Camera Shifting handled in core_Camera)
		if cINPUT.k_u_h and !move_lock
			anim_ID = ANI_PLAYER.LOOK_UP;

		else if cINPUT.k_d_h and !move_lock
			anim_ID = ANI_PLAYER.DUCK;

	}
	
	// Friction - Formula per the Sonic Physics Guide
	if (_dir == 0)
		inertia -= min(abs(inertia), accel_run) * sign(inertia);
	
	// Apply to x and y speeds using the acquired inertia.
	xsp = inertia * angle_data.cosine;
	ysp = inertia * -angle_data.sine;
}