/// @description Main

switch(routine)
{
	case 0:
		if ++wait_timer == 10 {
			routine++;
			gfunc_fade_perform(FADEMODE_INTO, FADEBLEND_BLACK, 0);
		}
	break;
	
	case 1:
		if ++wait_timer == 60 {
			routine++;
			gfunc_fade_perform(FADEMODE_FROM, FADEBLEND_BLACK, 1);
		}
	break;
	
	case 2:		
		if ++wait_timer == 91 {
			routine++;
			animated = true;
			cCAMERA.enabled = true;
			gfunc_audio_bgm_play(BGMs.TITLE);
		}
	break;
	
	case 3:
		cCAMERA.pos_x += 2;
		gfunc_palette_handle_range(PAL_PRIMARY, 0, 3, 4, 1, 6);
	
		// PSB triggers at the end of initial animation
		if (psb && !instance_exists(obj_StartMenu)) {
			routine++;
			instance_create_layer(x, 180, "Instances", obj_StartMenu);
		}
	break;
	
	case 4:
		cCAMERA.pos_x += 2;
		gfunc_palette_handle_range(PAL_PRIMARY, 0, 3, 4, 1, 6);
	break;
}