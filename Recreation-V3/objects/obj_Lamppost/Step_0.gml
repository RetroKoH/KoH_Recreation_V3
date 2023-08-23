/// @description Routine

switch(routine) {
	case 0:
	// Init
	{
		routine++;		// Go to Blue lamppost routine
		if (global.lamp_last >= index) {
			routine++;			// Skip to Red lamppost routine
			anim_ID = routine;
		}
	} break;
	
	case 1:
	// Blue
	{
		if (global.lamp_last >= index) {
			routine++;			// Skip to Red lamppost routine
			anim_ID = routine;
		}
		else {
			// Chkhit
			if (abs(cPLAYER.x-x+8) <= 16) and (abs(cPLAYER.y - y + 64) <= 104) {
				gfunc_audio_sfx_play(SFXs.LAMPPOST);
				routine++;	// Go to twirling lamppost routine
				anim_ID++;	// Twirling animation
				
				// Set lamp info
				gfunc_lamp_data_save(index);
			}
		}
	} break;
	
	// Routine 2 only displays
}