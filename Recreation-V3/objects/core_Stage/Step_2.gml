/// @description Process Gameplay

// Process stage time
if time_enabled {
	if game_time < 36000
		game_time++;
	if (game_time) == 36000
		ctrl_Player_Hurt(true, false);
}

// Process Player Post-Death Restart
if cPLAYER.routine == 4 {
	// If ran out of lives or time, start Game/Time Over event
	if !restart_timer {
		if !global.p_lives or game_time == 36000 {
			restart_event = true;		
			gfunc_audio_bgm_play(BGMs.GAME_OVER);
		}
	}
	restart_timer++;
	
	// Wait for 1 (or 12 if the event was triggered) seconds
	if restart_timer == restart_event * 660 + 60
	{
		gfunc_fade_perform(FADEMODE_INTO, FADEBLEND_BLACK, 1); 
				
		gfunc_audio_bgm_stop(AU_PRIMARY, 0.5);
		gfunc_audio_bgm_stop(AU_SECONDARY, 0.5);
				
		// Stop animations and objects
		cRENDER.update_anims	= false;
		run_objects				= false;
	}
	
	// Check if we faded out
	if gfunc_fade_check(FADESTATE_MAX) {
		if global.p_lives > 0
			room_restart();
		else
			room_goto(screen_Title);
	}
}

// Object bounds handling
if run_objects {
	// Get active bounds
	var _left  = (cCAMERA.view_x - 128) & -128;
	var _right = _left + (((global.win_width + 128) & -128) + 256);
	
	with obj_GameObj {
		switch (oob_type) {
			case OOB_DESTROY:
			{
				if x < _left or x > _right or y > core_Stage.bound_bottom or y < core_Stage.bound_top {
					var _len = array_length(child_sprites);
					if  _len {
						for (var i = 0; i < _len; i++)				
							instance_destroy(child_sprites[i]);
						child_sprites = [];
					}
					instance_destroy();
				}
			}
			break;
			
			case OOB_PAUSE:
			{
				if x < _left or x > _right
				{
					var _len = array_length(child_sprites);
					if  _len {
						for (var i = 0; i < _len; i++)				
							instance_destroy(child_sprites[i]);
						child_sprites = [];
					}
					instance_deactivate_object(id);
				}
			}
			break;
			
			case OOB_RESET:
			{
				if (x < _left or x > _right) and (oob_data[0] < _left or oob_data[0] > _right)
				{
					var _len = array_length(child_sprites);
					if  _len {
						for (var i = 0; i < _len; i++)				
							instance_destroy(child_sprites[i]);
						child_sprites = [];
					}
		
					// Reset data
					x			 = oob_data[0];
					y			 = oob_data[1];
					image_xscale = oob_data[2];
					image_yscale = oob_data[3];
					image_index  = oob_data[4];
					sprite_index = oob_data[5];
					visible      = oob_data[6];
							
					// Reset animation data
					gfunc_anims_reset();
									
					// Re-initialize variables
					routine = 0;
							
					// Deactivate object
					if  _len {
						for (var i = 0; i < _len; i++)
							instance_deactivate_object(child_sprites[i]);
					}
					instance_deactivate_object(id);
				}
			}
			break;
			
			default:
			break;
		}
	}
}

// Activate objects (object's that were unloaded this frame before WON'T be activated)
gfunc_gameobj_activate_range(cCAMERA.view_x);

// Process DLEs (Changing of boundaries)
	if script_exists(level_events)
		script_execute(level_events);

// Process boundaries
if !gfunc_fade_check(FADESTATE_ACTIVE) {
	// Update left boundary
	if bound_left < target_bound_left
	{
		if cCAMERA.view_x >= target_bound_left
			bound_left = target_bound_left;

		else
		{
			if cCAMERA.view_x >= bound_left
				bound_left = cCAMERA.view_x;

			bound_left = min(bound_left + 2, target_bound_left);
		}
	}
	else if bound_left > target_bound_left
		bound_left = max(target_bound_left, bound_left - 2);
	
	// Update right boundary
	if bound_right < target_bound_right
		bound_right = min(bound_right + 2, target_bound_right);

	else if bound_right > target_bound_right
	{
		if cCAMERA.view_x + global.win_width >= target_bound_right
		{
			bound_right = cCAMERA.view_x + global.win_width;
			bound_right = max(target_bound_right, bound_right - 2);
		}
		else if cCAMERA.view_x + global.win_width <= target_bound_right
			bound_right = target_bound_right;
	}
	
	// Update top boundary
	if bound_top < target_bound_top
	{
		if cCAMERA.view_y >= target_bound_top
			bound_top = target_bound_top;

		else
		{
			if cCAMERA.view_y > bound_top
				bound_top = cCAMERA.view_y;

			bound_top = min(bound_top + 2, target_bound_top);
		}
	}
	else if bound_top > target_bound_top
		bound_top = max(target_bound_top, target_bound_top - 2);
	
	// Update bottom boundary
	if bound_bottom < target_bound_bottom
	{
		// Scroll faster in GHZ3?
		var _speed = 2;//var _speed = room == Stage_GHZ3 ? 16 : 2;
		
		bound_bottom = min(bound_bottom + _speed, target_bound_bottom);
		bound_death  = target_bound_bottom;
	}
	else if bound_bottom > target_bound_bottom
	{
		if cCAMERA.view_y + global.win_height >= target_bound_bottom
		{
			bound_bottom = cCAMERA.view_y + global.win_height
			bound_bottom = max(target_bound_bottom, bound_bottom - 2);
		}
		else if cCAMERA.view_y + global.win_height <= target_bound_bottom
		{
			bound_bottom = target_bound_bottom;
		}
		bound_death = bound_bottom;
	}
}

