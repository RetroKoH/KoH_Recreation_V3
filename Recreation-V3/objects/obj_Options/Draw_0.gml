/// @description Draw menu screen

// Could use the overlay surface for this part
draw_set_font(FONT.Menu);
for (var _i = 0; _i < array_length(global.str_sections); _i++)
	draw_text(48, menu_y[_i], global.str_sections[_i]);

// This must be drawn in real-time
draw_set_color(#F0F000);
draw_text(48, menu_y[menu], global.str_sections[menu]);
draw_set_color(c_white);

// Draws out a menu based on the menu chosen
switch(menu)
{
	case 0: // GAMEPLAY
		for (var _i = 0; _i < array_length(global.str_opt_gameplay); _i++) {
			var _c = c_white;
			if _i == submenu_item	_c = #F0F000;
			if submenu == -1		_c = #A8A8A8;
			draw_set_color(_c);
			draw_text(152, menu_y[_i], global.str_opt_gameplay[_i]);

			var _val = global.opt_gameplay[_i];
			var _st = menu_item_game[_i];
			draw_text(280, menu_y[_i]+8, string(_st[_val]));
		}
	break;
	
	case 1: // CONTROLS
		for (var _i = 0; _i < array_length(global.str_opt_controls); _i++) {
			var _c = c_white;
			if _i == submenu_item	_c = #F0F000;
			if submenu == -1		_c = #A8A8A8;
			draw_set_color(_c);
			draw_text(152, menu_y[_i], global.str_opt_controls[_i]);
			
			var _val = global.keymap[_i];
			var _st = global._fhinputKeys[_val];
			draw_text(280, menu_y[_i]+8, _st);
		}
			
		draw_sprite_ext(spr_gamepad, submenu_item+1, 248, menu_y[7]+56, 0.75, 0.75, 0, c_white, 1);
	break;
	
	case 2: // VIDEO
		for (var _i = 0; _i < array_length(global.str_opt_video); _i++) {
			var _c = c_white;
			if _i == submenu_item	_c = #F0F000;
			if submenu == -1		_c = #A8A8A8;
			draw_set_color(_c);
			draw_text(152, menu_y[_i], global.str_opt_video[_i]);
			
			if _i == 0 draw_text(280, menu_y[0]+8, window_get_fullscreen() ? "ON" : "OFF");
			if _i == 1 draw_text(280, menu_y[1]+8, string(global.win_size));
			
			if _i == 2 {
				var _st = "STANDARD"; if (global.win_width == 424) _st = "WIDESCREEN";
				draw_text(280, menu_y[2]+8, _st);
			}
		}
	break;
	
	case 3: // AUDIO
		for (var _i = 0; _i < array_length(global.str_opt_audio); _i++) {
			var _c = c_white;
			if _i == submenu_item	_c = #F0F000;
			if submenu == -1		_c = #A8A8A8;
			draw_set_color(_c);
			draw_text(152, menu_y[_i], global.str_opt_audio[_i]);
			
			if _i == 0 draw_text(280, menu_y[0]+8, string(round(global.volume_bgm*100))+"%");
			if _i == 1 draw_text(280, menu_y[1]+8, string(round(global.volume_sfx*100))+"%");
			if _i == 2 draw_text(280, menu_y[2]+8, string(round(global.volume_amb*100))+"%");
			if _i == 3 draw_text(280, menu_y[3]+8, global.ring_panning ? "ON" : "OFF");
			if _i == 4 draw_text(280, menu_y[4]+8, string(sndTest_BGM));
			if _i == 5 draw_text(280, menu_y[5]+8, string(sndTest_SFX));
		}
	break;
}

draw_set_color(c_black);
draw_rectangle(0, 0, 31, 239, false);
draw_rectangle(392, 0, 423, 239, false)

draw_set_color(c_white);