function ctrl_Tails_StartFlight() {
	if !double_jump_flag {
		if cINPUT.k_abc_p {
			spinning = false;
			// Disable rolling jump
			height = height_def;
			width=WIDTH_MAIN;
			y--;							// Adjust y-pos slightly
			double_jump_flag=1;				// We are now flying
			double_jump_property=480;		// Flight lasts for 480 frames
			ctrl_Tails_SetFlightAnim();
		}
	}
}

function ctrl_Tails_SetFlightAnim() {
	var ani;
	if !(in_water) {
		ani		= ANI_PLAYER.FLY;
		var snd	= SFXs.FLYING;

		if !double_jump_property {
			ani = ANI_PLAYER.FLY_TIRED;
			snd = SFXs.FLY_TIRED;
		}

		else if abs(xsp) >= 4.5 and sign(xsp) == anim_direction
			ani = ANI_PLAYER.FLY_FAST;

		anim_ID = ani;

		if !global.framecount&$F
			gfunc_audio_sfx_play(snd);
	}

	else {
		ani = ANI_PLAYER.SWIM;

		if ysp <= 0
			ani = ANI_PLAYER.SWIM_UP;

		if !double_jump_property
			ani = ANI_PLAYER.SWIM_TIRED;

		anim_ID = ani;
	}
}