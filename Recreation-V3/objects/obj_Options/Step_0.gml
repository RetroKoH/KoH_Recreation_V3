/// @description Menu control

// Runs when exiting the options menu (Fading Out)
if (routine) {
	if !--timer
		room_goto(screen_Title);
	else exit;
}

// Scrolling up and down through the main options menu
if (submenu == -1) {
	if (cINPUT.k_u_p){
		menu = gfunc_wrap_value(--menu, 6);
		gfunc_audio_sfx_play(sfx_Switch, false);
	}

	if (cINPUT.k_d_p){
		menu = gfunc_wrap_value(++menu, 6);
		gfunc_audio_sfx_play(sfx_Switch, false);
	}
	
	if (cINPUT.k_c_p || cINPUT.k_st_p){
		submenu = menu;
		submenu_item = 0;
		gfunc_audio_sfx_play(sfx_Switch, false);
	}
	
	if (cINPUT.k_a_p){
		routine++;
		timer = 30;
		gfunc_fade_perform(FADEMODE_INTO, FADEBLEND_BLACK, 1);
	}
}

// Navigating through each submenu
else switch(submenu) {
	case 0: // GAMEPLAY
		var _end = array_length(global.str_opt_gameplay);

		if (cINPUT.k_u_p){
			submenu_item = gfunc_wrap_value(--submenu_item, _end);
			gfunc_audio_sfx_play(sfx_Switch, false);
		}

		if (cINPUT.k_d_p){
			submenu_item = gfunc_wrap_value(++submenu_item, _end);
			gfunc_audio_sfx_play(sfx_Switch, false);
		}
	
		var _item = submenu_item;
		var _val = global.opt_gameplay[_item];
		var _limit = array_length(menu_item_game[_item]);
			
		if (cINPUT.k_l_p){
			_val = gfunc_wrap_value(--_val, _limit);
			global.opt_gameplay[_item] = _val;
			gfunc_audio_sfx_play(sfx_Switch, false);
		}

		if (cINPUT.k_r_p){
			_val = gfunc_wrap_value(++_val, _limit);
			global.opt_gameplay[_item] = _val;
			gfunc_audio_sfx_play(sfx_Switch, false);
		}
		
		if (cINPUT.k_a_p){
			submenu = -1;
			submenu_item = -1;
			gfunc_audio_sfx_play(sfx_Switch, false);
		}
	break;
	
	case 1: // CONTROLS
		if !set_control{
			var _end = array_length(global.str_opt_controls);
			
			if (cINPUT.k_u_p){
				submenu_item = gfunc_wrap_value(--submenu_item, _end);
				gfunc_audio_sfx_play(sfx_Switch, false);
			}
		
			if (cINPUT.k_d_p){
				submenu_item = gfunc_wrap_value(++submenu_item, _end);
				gfunc_audio_sfx_play(sfx_Switch, false);
			}
		
			if (cINPUT.k_c_p){
				set_control = true;
				gfunc_audio_sfx_play(sfx_Switch, false);
			}
		
			if (cINPUT.k_a_p){
				submenu = -1;
				submenu_item = -1;
				gfunc_audio_sfx_play(sfx_Switch, false);
			}
		}
		else{
			if keyboard_check_pressed(vk_escape)
				set_control = false;
			
			else {
				var k = keyboard_key * keyboard_check_pressed(keyboard_key);
				if k != 0 {
					var _error = false;
				
					for (var i = 0; i<=KEYMAP.START; i++) {
						if k == global.keymap[i] _error = true;
					}
				
					if !_error
						if global._fhinputKeys[k] == "N/A" _error = true;
				
					if !_error
						global.keymap[submenu_item] = keyboard_key;
				
					set_control = false;
				}
			}
		}
	break;
	
	case 2: // VIDEO
		var _end = array_length(global.str_opt_video);

		if (cINPUT.k_u_p){
			submenu_item = gfunc_wrap_value(--submenu_item, _end);
			gfunc_audio_sfx_play(sfx_Switch, false);
		}

		if (cINPUT.k_d_p){
			submenu_item = gfunc_wrap_value(++submenu_item, _end);
			gfunc_audio_sfx_play(sfx_Switch, false);
		}
		
		if (cINPUT.k_l_p or cINPUT.k_r_p){
			switch(submenu_item)
			{
				case 0:
					window_set_fullscreen(!window_get_fullscreen()); 
					gfunc_audio_sfx_play(sfx_Switch, false);
				break;
				case 1:
					var _dir = cINPUT.k_r_p - cINPUT.k_l_p;
					global.win_size = clamp(global.win_size+_dir, 1, 4);
					gfunc_audio_sfx_play(sfx_Switch, false);
					window_set_size(global.win_width * global.win_size, global.win_height * global.win_size);
				break;
				case 2:
					if (global.win_width == 424)	global.win_width = 320;
					else							global.win_width = 424;
					window_set_size(global.win_width * global.win_size, global.win_height * global.win_size);
					gfunc_app_set_size(global.win_width, global.win_height);
				break;
			}
		}

		if (cINPUT.k_a_p){
			submenu = -1;
			submenu_item = -1;
			gfunc_audio_sfx_play(sfx_Switch, false);
		}
	break;
	
	case 3: // AUDIO
		var _end = array_length(global.str_opt_audio);

		if (cINPUT.k_u_p){
			submenu_item = gfunc_wrap_value(--submenu_item, _end);
			gfunc_audio_sfx_play(sfx_Switch, false);
		}

		if (cINPUT.k_d_p){
			submenu_item = gfunc_wrap_value(++submenu_item, _end);
			gfunc_audio_sfx_play(sfx_Switch, false);
		}
		
		if (cINPUT.k_l_p or cINPUT.k_r_p){
			var _dir = cINPUT.k_r_p - cINPUT.k_l_p;
			switch(submenu_item){
				case 0:
					_dir *= 0.1;
					global.volume_bgm = clamp(global.volume_bgm+_dir, 0, 1);
					audio_sound_gain(bgm_LevSel, global.volume_bgm, 0);
					gfunc_audio_sfx_play(sfx_Switch, false);
				break;
				
				case 1:
					_dir *= 0.1;
					global.volume_sfx = clamp(global.volume_sfx+_dir, 0, 1);
					gfunc_audio_sfx_play(sfx_Switch, false);
				break;
				
				case 2:
					_dir *= 0.1;
					global.volume_amb = clamp(global.volume_amb+_dir, 0, 1);
					gfunc_audio_sfx_play(sfx_Switch, false);
				break;
				
				case 3:
					global.ring_panning^=true;
					gfunc_audio_sfx_play(sfx_Switch, false);
				break;
			}
		}

		if (cINPUT.k_a_p){
			submenu = -1;
			submenu_item = -1;
			gfunc_audio_sfx_play(sfx_Switch, false);
		}
	break;
}