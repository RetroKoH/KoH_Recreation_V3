function ctrl_Sonic_Peelout() {
	if cINPUT.k_u_h {
		if peelout_timer == -1 {
			if anim_ID == ANI_PLAYER.LOOK_UP and cINPUT.k_abc_p {
				// Initialize Peelout
				anim_ID			= ANI_PLAYER.PEELOUT;
				peelout_timer	= 0;
				gfunc_audio_sfx_play(SFXs.PEELOUT_REV);
				return true;
			}
		}
	
		else {
			if (peelout_timer < 30)
				peelout_timer++;
			return true;
		}
	}
	
	// Check to Release Peelout
	else {
		// Release Peelout
		if peelout_timer == 30 {
			inertia			= flipped ? -12 : 12;
			anim_ID			= ANI_PLAYER.WALK;
			peelout_timer	= -1;
			gfunc_audio_sfx_stop(SFXs.PEELOUT_REV);
			gfunc_audio_sfx_play(SFXs.PEELOUT_REL);
			
			// Prevent jumping straight upward
			xsp = inertia * angle_data.cosine;
			ysp = inertia * -angle_data.sine;
			
			return true;
		}
		
		// Cancel Peelout
		else
			peelout_timer = -1;
	}

	return false;
}