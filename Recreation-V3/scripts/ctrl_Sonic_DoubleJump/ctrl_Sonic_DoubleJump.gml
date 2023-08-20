function ctrl_Sonic_DoubleJump(){
	if !double_jump_flag {
		if cINPUT.k_abc_p {
			if (super or invinc) double_jump_flag = true; // just stop here
			else if shield == SHIELD.FLAME		ctrl_Sonic_FlameShield();
			else if shield == SHIELD.LIGHTNING	ctrl_Sonic_LightningShield();
			else if shield == SHIELD.BUBBLE		ctrl_Sonic_BubbleShield();
			// else if emeralds == 7 && rings >= 50 scr_sonic_super();
			// else if !powerups&POW_SHIELD	scr_sonic_instashield();
			else double_jump_flag = true; // stop here*/
			
			double_jump_flag = true;
		}
	}
	
	// If flag is set, check for Drop Dash
	else {
		if shield < SHIELD.FLAME and double_jump_property >= 0 {
			if cINPUT.k_abc_h {
				if double_jump_property < 20 {
					if ++double_jump_property == 20 {
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
}

// Elemental Shield Jumps
function ctrl_Sonic_FlameShield() {
	my_shield.anim_ID = ANI_SHIELD.SHIELD_F2;
	double_jump_flag = true;
	xsp = 8*anim_direction;
	ysp = 0;
	inertia = xsp;
	gfunc_audio_sfx_play(SFXs.SHIELD_FL2);
}
function ctrl_Sonic_LightningShield() {
	double_jump_flag = true;
	ysp = -5.5;
	jump = false;	// Clear flag to avoid variable jump height
	gfunc_audio_sfx_play(SFXs.SHIELD_LT2);
}
function ctrl_Sonic_BubbleShield() {
/*On steep slopes, the bubble shield is unlikely to bounce at the right angle.
That's because this bounce happens AFTER Sonic lands and has calculated his new Ground Speeds
and new X Speed and Y Speed from landing on the ground. On steep slopes, this landing Y Speed
is likely to be high (downwards), effectively cancelling out a lot of the bounce Y Speed.*/
	my_shield.anim_ID = ANI_SHIELD.SHIELD_B2;
	double_jump_flag = true;
	xsp = 0;
	gsp = 0;
	ysp = 8;		// Rebound force is 7.5 (adjusted for angle)
	gfunc_audio_sfx_play(SFXs.SHIELD_BB2);
}