function ctrl_Sonic_DoubleJump(){
	if !double_jump_flag {
		if cINPUT.k_abc_p {
			/*if (super || powerups&POW_INVINC) double_jump_flag = true; // just stop here
			else if powerups&POW_FLAME		scr_sonic_flameshield();
			else if powerups&POW_BUBBLE		scr_sonic_bubbleshield();
			else if powerups&POW_LIGHTNING	scr_sonic_lightningshield();
			// else if emeralds == 7 && rings >= 50 scr_sonic_super();
			else if !powerups&POW_SHIELD	scr_sonic_instashield();
			else double_jump_flag = true; // stop here*/
			
			double_jump_flag = true;
		}
	}
	
	// If flag is set, check for Drop Dash
	else {
		if cINPUT.k_abc_h {
			if double_jump_property < 20 {
				double_jump_property++;
				if double_jump_property == 20 {
					anim_ID = ANI_PLAYER.DROPDASH;
					gfunc_audio_sfx_play(SFXs.DROPDASH_REV);
				}
			}
		}
		else {
			double_jump_property = -1; // Cancels Drop Dash
			if anim_ID == ANI_PLAYER.DROPDASH
				anim_ID = ANI_PLAYER.ROLL;
		}
	}
}