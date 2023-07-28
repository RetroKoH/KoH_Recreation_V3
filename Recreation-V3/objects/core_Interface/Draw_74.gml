/// @description In-Game UI

surface_set_target(cRENDER.surface_overlay);
draw_clear_alpha(c_white, 0);

// =========================

// Title Card Drawing
var _speed = 16 * (global.win_width / 320);

if card_routine < 3 {
	switch(card_routine) {
		case 0:
		{
			if card_timer == 0
			{
				if !gfunc_fade_check(FADESTATE_ACTIVE)
					Stage.UpdateObjects = true;
			}
			card_timer++;
			
			if card_name_x != global.win_width / 2 + 92
			{
				if card_timer > 10
				{
					card_oval_x = max(card_oval_x - _speed, global.win_width / 2 + 52);
					card_name_x = min(card_name_x + _speed, global.win_width / 2 + 92);
				}
				if card_name_x == global.win_width / 2 + 92
					card_timer = 0;
			}
			else if card_zone_x != global.win_width / 2 + 68
			{
				if card_timer > 4
					card_zone_x = min(card_zone_x + _speed, global.win_width / 2 + 68);
			}
		
			else if card_act_x != global.win_width / 2 + 53
				card_act_x = max(card_act_x - _speed, global.win_width / 2 + 53);

			else
			{
				card_timer = 0;
				card_routine++;
			}
		} break;
		
		case 1:
		{
			if (++card_timer) == 135
			{
				if gfunc_fade_check(FADESTATE_MAX)
					gfunc_fade_perform(FADEMODE_FROM, FADEBLEND_BLACK, 1);
			}
			else if card_timer > 135
			{
				if !gfunc_fade_check(FADESTATE_ACTIVE)
				{
					cRENDER.update_anims	= true;
					core_Stage.run_objects	= true;
					core_Stage.time_enabled	= true;
					cCAMERA.enabled			= true;
					cINPUT.ignore_input		= false;
				
					card_timer = 0;
					card_routine++;
				}
			}
		} break;
		
		case 2:
		{
			if (++card_timer) > 58
			{
				card_name_x -= _speed * 2;
				card_zone_x -= _speed * 2;
				card_oval_x += _speed * 2;
				card_act_x  += _speed * 2;
			}
			if card_timer > 64 + (global.win_width / 2 + 92) / _speed * 2
			{
				card_timer = 0;
				card_routine++;
			}
		} break;
	}
	
	// Draw assets
	draw_sprite(spr_CardOval, 0,					card_oval_x,	global.win_height / 2 - 16);
	draw_sprite(spr_CardActs, core_Stage.act_ID,    card_act_x,		global.win_height / 2 - 6);

	draw_set_halign(fa_right); 
	draw_set_font(FONT.TitleCard);
	
	draw_text(card_name_x,	global.win_height / 2 - 32, core_Stage.zone_name);
	draw_text(card_zone_x,	global.win_height / 2 - 12, "ZONE");
}

// =========================

surface_reset_target();