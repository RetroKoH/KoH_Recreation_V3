/// @description Main

switch(routine)
{
	case 0:
		wait_timer++;

		if wait_timer == 60 {
			routine++;
			var _bkg = layer_background_get_id(layer_get_id("bkg_color"));
			layer_background_blend(_bkg, c_white)
			gfunc_fade_perform(FADEMODE_FROM, FADEBLEND_BLACK, 1);
		}
	break;
	
	case 1:
		wait_timer++;
		
		if wait_timer == 80 {
			routine++;
			visible = true;
			image_speed = 1;
		}
	break;
	
	case 2:
		if image_index == image_number-1 {
			routine++;
			wait_timer = 0;
			image_speed = 0;
		}
	break;
	
	case 3:
		wait_timer++;
		
		if wait_timer == 10 {
			routine++;
			SEGA = audio_play_sound(sfx_SEGA, 0, false);
		}
	break;
	
	case 4:
		if !audio_is_playing(SEGA) {
			routine++;
			wait_timer = 0;
		}
	break;
	
	case 5:
		wait_timer++;
		
		if wait_timer == 30 {
			routine++;
			gfunc_fade_perform(FADEMODE_INTO, FADEBLEND_BLACK, 1);
		}
	break;
	
	case 6:
		wait_timer++;
		
		if wait_timer == 60 {
			routine++;
			room_goto(screen_Title);
		}
	break;
}

/*	switch (++wait_timer)
	{
		case 60:
			var _bkg = layer_background_get_id(layer_get_id("bkg_color"));
			layer_background_blend(_bkg, c_white)
			gfunc_fade_perform(FADEMODE_FROM, FADEBLEND_BLACK, 1);
		break;
		case 80:
			visible = true;
			image_speed = 1;
		break;
		case 320:
			gfunc_fade_perform(FADEMODE_INTO, FADEBLEND_BLACK, 1);
		break;
		//case 180:
		//	room_goto(global.StartRoom);
		//break;
	}