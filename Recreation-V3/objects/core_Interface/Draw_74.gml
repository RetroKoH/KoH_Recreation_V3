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

	if global.framecount%8 == 0
		HUD_blinking^=1;

	if !global.debugmode
	{	
		// SCORE TIME RINGS
		draw_sprite(spr_HUD, 0, _xx, _yy); // SCORE
		
		if _min == 9
				draw_sprite(spr_HUD, 1 + HUD_blinking,	_xx, _yy + 16); // TIME (Blinking)
		else	draw_sprite(spr_HUD, 1,					_xx, _yy + 16); // TIME
		
		if global.p_rings == 0
				draw_sprite(spr_HUD, 3 + HUD_blinking,	_xx, _yy + 32); // RINGS (Blinking)
		else	draw_sprite(spr_HUD, 3,					_xx, _yy + 32); // RINGS

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

// Results Card Drawing
if core_Stage.finished == 2 {

	if !core_Stage.paused {
		var _speed = 16 * (global.win_width / 320);
		switch(rcard_routine) {
			case RCARD_INIT:
			{
				rcard_routine++;
				
				// Set positions for each subsprite
				rcard_xpos[0] = -((string_length(char_name)*16)+16);
				rcard_start_x[0] = rcard_xpos[0];
				rcard_main_x[0] = rcard_char.mainx;
				rcard_ypos[0] = rcard_char.mainy;
				
				/*	1-PASSED
					2-ACT X
					3-OVAL
					4-SCORE
					5-TIME BONUS
					6-RING BONUS
					7-COOL BONUS
				*/
				for (var _i = 1; _i <= 7; _i++) {
					if _i == 1
						rcard_xpos[_i] = -((string_length("PASSED")*16)+16);
					else
						rcard_xpos[_i] = (global.win_width)+32;

					rcard_start_x[_i] = rcard_xpos[_i];
					rcard_main_x[_i]  = global.GotCard_ConData[PLMODE.TOTAL+(_i-1)].mainx;
					rcard_ypos[_i]    = global.GotCard_ConData[PLMODE.TOTAL+(_i-1)].mainy; 
				}
			} break;

			case RCARD_ENTER:
			{
				for (var i = 0; i <= 7; i++) {
					var _diff = rcard_main_x[i] - rcard_xpos[i];

					if (_diff != 0){
						if (abs(_diff) < _speed) rcard_xpos[i] = rcard_main_x[i];
						else if (_diff < 0) rcard_xpos[i] -= _speed;
						else rcard_xpos[i] += _speed;
					}
					else rcard_finished[i] = true;
				}
				if (rcard_finished[0] and rcard_finished[1] and rcard_finished[2] and rcard_finished[3] and
					rcard_finished[4] and rcard_finished[5] and rcard_finished[6] and rcard_finished[7])
						rcard_routine++;
			} break;
			
			case RCARD_WAIT:
			{
				if !audio_is_playing(global.BGM_list[BGMs.ACT_CLEAR].ID)
					rcard_routine++;
			} break;
			
			case RCARD_SCORETALLY:
			{
				// Quickly apply score bonuses
				rcard_routine++;
				rcard_timer = 120;
				
				gfunc_score_add(global.timebonus + global.ringbonus + global.coolbonus)
				global.timebonus = 0;
				global.ringbonus = 0;
				global.coolbonus = 0;
				audio_play_sound(sfx_EndTally,1,false);
			} break;
			
			case RCARD_WAITOUT:
			{
				// Timer to go away
				if !--rcard_timer {
					rcard_routine++;
					for (var _i = 0; _i <= 7; _i++) rcard_finished[_i] = false;
				}
			} break;
			
			case RCARD_LEAVE:
			{
				_speed += _speed;
				for (var i = 0; i <= 7; i++) {
					var _diff = rcard_start_x[i] - rcard_xpos[i];
				
					if (_diff != 0) {
						if (abs(_diff) < _speed)
							rcard_xpos[i] = rcard_start_x[i];
						else if (_diff > 0)
							rcard_xpos[i] += _speed;
						else
							rcard_xpos[i] -= _speed;
					}
				
					else rcard_finished[i] = true;
				}
				if (rcard_finished[0] and rcard_finished[1] and rcard_finished[2] and rcard_finished[3] and
					rcard_finished[4] and rcard_finished[5] and rcard_finished[6] and rcard_finished[7]) {
						rcard_routine++;
						core_Stage.finished = 3;
					}
			} break;
		}
	}

	draw_sprite(spr_CardBonus,	3,				rcard_xpos[7],	rcard_ypos[7]);
	draw_sprite(spr_CardBonus,	2,				rcard_xpos[6],	rcard_ypos[6]);
	draw_sprite(spr_CardBonus,	1,				rcard_xpos[5],	rcard_ypos[5]);
	draw_sprite(spr_CardBonus,	0,				rcard_xpos[4],	rcard_ypos[4]);
	draw_sprite(spr_CardOval,	0,				rcard_xpos[3],	rcard_ypos[3]);
	if (act_flag)
		draw_sprite(spr_CardActs,	act_num,	rcard_xpos[2],	rcard_ypos[2]);
	draw_surface(surf_pass,						rcard_xpos[1],	rcard_ypos[1]);
	draw_surface(surf_char,						rcard_xpos[0],	rcard_ypos[0]);

	// Draw the text
	var _f = draw_get_font();		draw_set_font(FONT.HUDNum);
	var _ha = draw_get_halign();	draw_set_halign(fa_right);
	var _va = draw_get_valign();	draw_set_valign(fa_middle);

	var _dist = 152;
	draw_text_ext_transformed(rcard_xpos[4]+_dist,	rcard_ypos[4],	global.p_score,		0,56,1,1,0);	// Score
	draw_text_ext_transformed(rcard_xpos[5]+_dist,	rcard_ypos[5],	global.timebonus,	0,56,1,1,0);	// Time Bonus
	draw_text_ext_transformed(rcard_xpos[6]+_dist,	rcard_ypos[6],	global.ringbonus,	0,56,1,1,0);	// Ring Bonus
	draw_text_ext_transformed(rcard_xpos[7]+_dist,	rcard_ypos[7],	global.coolbonus,	0,56,1,1,0);	// Cool Bonus

	draw_set_font(_f);
	draw_set_halign(_ha);
	draw_set_valign(_va);
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