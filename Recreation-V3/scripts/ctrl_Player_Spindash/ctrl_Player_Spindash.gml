function ctrl_Player_Spindash() {
	// Check to rev spindash
	if cINPUT.k_d_h {
		if spindash_rev == -1 {
			if anim_ID == ANI_PLAYER.DUCK and cINPUT.k_abc_p {
				// Initialize Spindash
				anim_ID			= ANI_PLAYER.SPINDASH;
				spindash_rev	= 2;
				xsp				= 0;
				gfunc_audio_sfx_play(SFXs.SPINDASH_REV);
				return true;
			}
		}
		
		// Manage Spindash revving
		else {
			if cINPUT.k_abc_p {
				spindash_rev = min(spindash_rev + 2, 8);
				//animation_reset(0);
				gfunc_audio_sfx_play(SFXs.SPINDASH_REV);
				return true;
			}
			else {
				if (spindash_rev > 0) {
					spindash_rev -= floor(spindash_rev / 0.125) / 256;

					if (spindash_rev < 0)
						spindash_rev = -1;	// Cancel Spindash
					else
						return true;
				}
			}
		}
	}
	
	// Check to release spindash
	else if spindash_rev {
		// Releasing spindash
		height			= HEIGHT_ROLL;
		width			= WIDTH_ROLL;
		anim_ID			= ANI_PLAYER.ROLL;
		y				+= height_def - height;
		spinning		= true;
		spindash_rev	= -1;

		inertia = (8 + (floor(spindash_rev) / 2)) * (flipped ? -1 : 1);
		gfunc_audio_sfx_play(SFXs.SPINDASH_REL);
		
		// Prevent jumping straight upward
		xsp = inertia * angle_data.cosine;
		ysp = inertia * -angle_data.sine;
	}
	
	return false;
}