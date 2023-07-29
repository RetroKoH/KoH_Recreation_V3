/// @description In-Game UI

// Target the high plane
surface_set_target(cRENDER.surface_overlay);
draw_clear_alpha(c_white, 0);

// =========================

// HUD Drawing
if HUD_enabled {
	
}

// Title Card Drawing
if tcard_routine < TCARD_FINISHED {
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
				cRENDER.update_anims	= true;
				core_Stage.time_enabled	= true;
				core_Stage.run_objects	= true;
				cCAMERA.enabled			= true;
				cINPUT.ignore_input		= false;
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
		draw_sprite(spr_CardOval,	0,			tcard_xpos[3],	tcard_ypos[3]);
	if (act_flag)
		draw_sprite(spr_CardActs,	act_num,	tcard_xpos[2],	tcard_ypos[2]);
		draw_surface(surf_zone,					tcard_xpos[1],	tcard_ypos[1]);
		draw_surface(surf_name,					tcard_xpos[0],	tcard_ypos[0]);
}

// =========================

// Reset target surface
surface_reset_target();