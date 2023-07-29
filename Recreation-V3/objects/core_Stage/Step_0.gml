/// @description Process Gameplay

// Process stage time
if time_enabled
{
	while game_time < 36000
		game_time++;
//	if (++game_time) == 36000
//		player_damage(false, false, true);
}

// Object bounds handling
//if run_objects

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

