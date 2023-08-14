function ctrl_Player_Spindash() {
	// Check to rev spindash
	if spindash_rev == -1 {
		if anim_ID == ANI_PLAYER.DUCK and cINPUT.k_abc_p {
			// Initialize Spindash
			anim_ID			= ANI_PLAYER.SPINDASH;
			spindash_rev	= 2;
			xsp				= 0;
			gfunc_audio_sfx_play(SFXs.SPINDASH_REV);
			ctrl_Player_LevelBound();
			ctrl_Player_AnglePos();
			
			// Create dust effect
			var _dust = instance_create_layer(x, y + height + 1, "Instances", obj_SpindashDust);
			_dust.parent = id;
			return true;	// Skip the rest of the Normal Mode Routine
		}
	}
	
	else {
		if !cINPUT.k_d_h {
			// Releasing spindash
			height			= HEIGHT_ROLL;
			width			= WIDTH_ROLL;
			anim_ID			= ANI_PLAYER.ROLL;
			y				+= height_def - height;
			spinning		= true;

			inertia = (8 + (floor(spindash_rev) / 2)) * (flipped ? -1 : 1);
			gfunc_audio_sfx_stop(SFXs.SPINDASH_REV);
			gfunc_audio_sfx_play(SFXs.SPINDASH_REL);
			spindash_rev	= -1;
		
			// Prevent jumping straight upward
			xsp = inertia * angle_data.cosine;
			ysp = inertia * -angle_data.sine;
		}
		
		else {
			// Manage Spindash revving
			if (spindash_rev > 0) {
				spindash_rev -= (floor(spindash_rev / 0.125) / 256);

				if (spindash_rev <= 0.12109375) {
					spindash_rev = -1;	// Cancel Spindash
					return false;
				}
			}
			if cINPUT.k_abc_p {
				spindash_rev = min(spindash_rev + 2, 8);
				//animation_reset(0);
				gfunc_audio_sfx_play(SFXs.SPINDASH_REV);
			}
		}
		ctrl_Player_LevelBound();
		ctrl_Player_AnglePos();
		return true;	// Skip the rest of the Normal Mode Routine
	}
	return false;
}