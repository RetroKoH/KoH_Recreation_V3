function ctrl_Player_Hurt(_death, _spiked){
	// Change this to an array of sounds to stop (Namely, character ability sfx)
	gfunc_audio_sfx_stop(SFXs.DROPDASH_REV);
	gfunc_audio_sfx_stop(SFXs.SPINDASH_REV);
	
	// If no rings and no shield OR instant death
	if _death {
		cCAMERA.enabled			= false;
		core_Stage.time_enabled	= false;
		
		routine			= 3;	// Player enters death routine
		// Clear Invinc status and remove stars
		// super = false
		in_air			= true;
		ysp				= -7;
		xsp				= 0;
		inertia			= 0;
		anim_ID			= ANI_PLAYER.DEATH;
		// Cool Bonus = 0. Death removes said point bonus
		if (_spiked) gfunc_audio_sfx_play(SFXs.SPIKED);
		else gfunc_audio_sfx_play(SFXs.HURT);
	}
}