/// @description In-Game UI

// Target the high plane
surface_set_target(cRENDER.surface_overlay);
draw_clear_alpha(c_white, 0);

// =========================

// HUD Drawing
if HUD_enabled {
	
	// It seems that if this is disabled, controls don't unlock
	if HUD_offset_x < 18 {
		HUD_offset_x += 6;
	}
	
	// Get position for overlay
	var _xx = HUD_offset_x;
	var _yy = HUD_offset_y;
	
	// Handle game time
	var _time = core_Stage.game_time;
	var _min, _sec, _centi;

	if _time < 35999 {
		_min	= _time div 3600;
		_sec	= (_time - _min * 3600) div 60;
		_centi	= global.centiseconds[_time mod 60];
	}
	else {
		_min	= 9;
		_sec	= 59;
		_centi	= 99;
	}
	
	if !global.debugmode
	{
		// SCORE TIME RINGS
		draw_sprite(spr_HUD, 0, _xx, _yy); // SCORE
		draw_sprite(spr_HUD, 1, _xx, _yy + 16); // TIME
		draw_sprite(spr_HUD, 2, _xx, _yy + 32); // RINGS
	
		draw_set_font(FONT.HUDNum);	draw_set_halign(fa_right);
		var _time_str = string(_min) + ":" + (_sec > 9 ? string(_sec) : "0" + string(_sec));
		if global.opt_gameplay[7]
			_time_str = string(_min) + "'" + (_sec > 9 ? string(_sec) : "0" + string(_sec)) +
						";" + (_centi > 9 ? string(_centi) : "0" + string(_centi));

		draw_text(_xx + 96, _yy,	  string(global.p_score));	// Draw out score
		draw_text(_xx + 96, _yy + 16, _time_str);				// Draw out time
		draw_text(_xx + 96, _yy + 32, string(global.p_rings));	// Draw out rings
	}
}

// =========================

// Title Card Drawing
if tcard_routine < TCARD_FINISHED {

	if !core_Stage.paused {
		var _speed = 16 * (global.win_width / 320);
		switch(tcard_routine) {
			case TCARD_INIT:
			{
				tcard_routine++;
			
				// Set positions for each subsprite
				tcard_xpos[0] = -((string_length(zone_name)*16)+16);
				tcard_start_x[0] = tcard_xpos[0];
				tcard_main_x[0] = tcard_zone.name_mainx;
		
				tcard_xpos[1] = -((string_length("ZONE")*16)+16);
				tcard_start_x[1] = tcard_xpos[1];
				tcard_main_x[1] = tcard_zone.zone_mainx;
		
				tcard_xpos[2] = (global.win_width)+32;
				tcard_start_x[2] = tcard_xpos[2];
				tcard_main_x[2] = tcard_zone.acts_mainx;
		
				tcard_xpos[3] = (global.win_width)+32;
				tcard_start_x[3] = tcard_xpos[3];
				tcard_main_x[3] = tcard_zone.oval_mainx;

				for (var i = 0; i < 4; i++)
					tcard_ypos[i] = global.TtlCard_ItemY[i];
		
				if (act_flag)	act_num = core_Stage.act_ID;
				else			act_num = -1;
			} break;
		
			case TCARD_ENTER:
			{
				for (var i = 0; i < 4; i++) {
					var _diff = tcard_main_x[i] - tcard_xpos[i];

					if (_diff != 0){
						if (abs(_diff) < _speed) tcard_xpos[i] = tcard_main_x[i];
						else if (_diff < 0) tcard_xpos[i] -= _speed;
						else tcard_xpos[i] += _speed;
					}
					else tcard_finished[i] = true;
				}
				if (tcard_finished[0] and tcard_finished[1] and tcard_finished[2] and tcard_finished[3])
				{
					tcard_routine++;
					tcard_timer=120;
				}
			}
			break;
		
			case TCARD_WAIT:
			{
				if --tcard_timer == 0 {
					tcard_routine++;
					tcard_timer=90;
					gfunc_fade_perform(FADEMODE_FROM, FADEBLEND_BLACK, 1);
				}
			}
			break;
		
			case TCARD_FADEIN:
			{
				if !gfunc_fade_check(FADESTATE_ACTIVE) {
					HUD_enabled				= true;
					cRENDER.update_anims	= true;
					core_Stage.run_objects	= true;
					cCAMERA.enabled			= true;
				}
				if HUD_offset_x == 18 and !core_Stage.time_enabled {
					core_Stage.time_enabled	= true;
					core_Stage.can_pause = true;
					//cINPUT.ignore_input		= false; Change to player.ignore_input = false;
				}
				if --tcard_timer == 0 {
					tcard_routine++;
					for (var i = 0; i < 4; i++) tcard_finished[i] = false;
				}
			}
			break;
		
			case TCARD_LEAVE:
			{
				_speed += _speed;
				for (var i = 0; i < 4; i++) {
					var _diff = tcard_start_x[i] - tcard_xpos[i];
				
					if (_diff != 0) {
						if (abs(_diff) < _speed)
							tcard_xpos[i] = tcard_start_x[i];
						else if (_diff > 0)
							tcard_xpos[i] += _speed;
						else
							tcard_xpos[i] -= _speed;
					}
				
					else tcard_finished[i] = true;
				}
				if (tcard_finished[0] && tcard_finished[1] && tcard_finished[2] && tcard_finished[3])
					tcard_routine++;
			}
			break;
		}
	}

		draw_sprite(spr_CardOval,	0,			tcard_xpos[3],	tcard_ypos[3]);
	if (act_flag)
		draw_sprite(spr_CardActs,	act_num,	tcard_xpos[2],	tcard_ypos[2]);
		draw_surface(surf_zone,					tcard_xpos[1],	tcard_ypos[1]);
		draw_surface(surf_name,					tcard_xpos[0],	tcard_ypos[0]);
}

// =========================

// Reset target surface
surface_reset_target();