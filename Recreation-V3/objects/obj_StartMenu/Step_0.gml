/// @description Menu Control

switch(routine)
{
	case 0:
		if !--timer
		{
			timer = 16;			// Reset timer
			visible ^= true;	// Toggle visibility
		}

		if (cINPUT.k_st_p)
		{
			routine++;			// Activate menu
			timer = 16;
			visible = true;
		}
	break;
	
	case 1: // Menu
		if (cINPUT.k_u_p || cINPUT.k_d_p)
		{
			option ^= 1;	// This is fine for only two options
			audio_play_sound(sfx_Switch,1,false);
		}
		if (cINPUT.k_st_p)
		{
			routine++;
			timer = 30;
			gfunc_fade_perform(FADEMODE_INTO, FADEBLEND_BLACK, 1);
		}
	break;
	
	case 2: // Leaving Title Screen
		if !--timer
			switch(option)
			{
				case 0:
					room_restart();
				break;
				case 1:
					room_goto(screen_Options);
				break;
			}
	break;
}