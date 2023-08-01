/// @description Handle Pausing

/* Value table
---------------
Value[0] - Option
Value[1] - Menu
---------------
*/
	
if paused
{	
	// React to action or start button
	//if !gfunc_fade_check(FADESTATE_ACTIVE)
	{
		//PauseTimer++;
		//PauseTimer = PauseTimer mod 16;
			
		if cINPUT.k_st_p
		{
			// Resume
			paused					= false;
			time_enabled			= true;
			run_objects				= true;
			cCAMERA.enabled			= true;
			cRENDER.update_anims	= true;
					
			gfunc_gameobj_activate_range(cCAMERA.view_x);
					
			audio_resume_all();
			//audio_sfx_play(sfxPauseBack, false);
		}
			
		// Clear input
		cINPUT.k_st_p = false;
	}
}

else if cINPUT.k_st_p
{
	// If we pressed start button and are allowed to pause, then pause!
	if (core_Interface.tcard_routine >= TCARD_LEAVE or time_enabled) // and !Stage.IsFinished and !Player.Death
	{			
		cRENDER.update_anims	= false;
		run_objects				= false;
		time_enabled			= false;
		paused					= true;
		cINPUT.k_st_p			= false;
		cCAMERA.enabled			= false;
			
		audio_pause_all();
		//audio_sfx_play(sfxPauseSelect, false);
	}
}




