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
		audio_play_sound(sfx_Switch,1,false);
	}

	if (cINPUT.k_d_p){
		menu = gfunc_wrap_value(++menu, 6);
		audio_play_sound(sfx_Switch,1,false);
	}
	
	if (cINPUT.k_c_p || cINPUT.k_st_p){
		submenu = menu;
		submenu_item = 0;
		audio_play_sound(sfx_Switch,1,false);
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
			audio_play_sound(sfx_Switch,1,false);
		}

		if (cINPUT.k_d_p){
			submenu_item = gfunc_wrap_value(++submenu_item, _end);
			audio_play_sound(sfx_Switch,1,false);
		}
	
		var _item = submenu_item;
		var _val = global.opt_gameplay[_item];
		var _limit = array_length(menu_item_game[_item]);
			
		if (cINPUT.k_l_p){
			_val = gfunc_wrap_value(--_val, _limit);
			global.opt_gameplay[_item] = _val;
			audio_play_sound(sfx_Switch,1,false);
		}

		if (cINPUT.k_r_p){
			_val = gfunc_wrap_value(++_val, _limit);
			global.opt_gameplay[_item] = _val;
			audio_play_sound(sfx_Switch,1,false);
		}
		
		if (cINPUT.k_a_p){
			submenu = -1;
			submenu_item = -1;
			audio_play_sound(sfx_Switch,1,false);
		}
	break;
	
	case 1: // CONTROLS
		if !set_control{
			var _end = array_length(global.str_opt_controls);
			
			if (cINPUT.k_u_p){
				submenu_item = gfunc_wrap_value(--submenu_item, _end);
				audio_play_sound(sfx_Switch,1,false);
			}
		
			if (cINPUT.k_d_p){
				submenu_item = gfunc_wrap_value(++submenu_item, _end);
				audio_play_sound(sfx_Switch,1,false);
			}
		
			if (cINPUT.k_c_p){
				set_control = true;
				audio_play_sound(sfx_Switch,1,false);
			}
		
			if (cINPUT.k_a_p){
				submenu = -1;
				submenu_item = -1;
				audio_play_sound(sfx_Switch,1,false);
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
			audio_play_sound(sfx_Switch,1,false);
		}

		if (cINPUT.k_d_p){
			submenu_item = gfunc_wrap_value(++submenu_item, _end);
			audio_play_sound(sfx_Switch,1,false);
		}

		if (cINPUT.k_a_p){
			submenu = -1;
			submenu_item = -1;
			audio_play_sound(sfx_Switch,1,false);
		}
	break;
	
	case 3: // AUDIO
		var _end = array_length(global.str_opt_audio);

		if (cINPUT.k_u_p){
			submenu_item = gfunc_wrap_value(--submenu_item, _end);
			audio_play_sound(sfx_Switch,1,false);
		}

		if (cINPUT.k_d_p){
			submenu_item = gfunc_wrap_value(++submenu_item, _end);
			audio_play_sound(sfx_Switch,1,false);
		}

		if (cINPUT.k_a_p){
			submenu = -1;
			submenu_item = -1;
			audio_play_sound(sfx_Switch,1,false);
		}
	break;
}