/// @description Main

switch(routine)
{
	case 0:
		if ++wait_timer == 60 {
			routine++;
			var _bkg = layer_background_get_id(layer_get_id("Background_Color"));
			layer_background_blend(_bkg, #F0F0F0);
			gfunc_fade_perform(FADEMODE_FROM, FADEBLEND_BLACK, 1);
		}
	break;
	
	case 1:		
		if ++wait_timer == 80 {
			routine++;
			visible = true;
		}
	break;
	
	// Palette Cycling
	case 2:
		var _col = gfunc_palette_get_col(PAL_PRIMARY, 0);
		if  _col < 58
			gfunc_palette_handle_range(PAL_PRIMARY, 0, 51, 58, 58, 1);

		else {routine++; wait_timer=0}
	break;
	
	case 3:		
		if ++wait_timer == 10 {
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
		if ++wait_timer == 30 {
			routine++;
			gfunc_fade_perform(FADEMODE_INTO, FADEBLEND_BLACK, 1);
		}
	break;
	
	case 6:	
		if ++wait_timer == 60
			room_goto(screen_Options);
	break;
}