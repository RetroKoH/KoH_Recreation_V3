function ctrl_Player_CheckWalls() {
	// Exit if not moving, or if angle is too steep and not a cardinal one (90, 180, 270)
	if inertia == 0 or ((angle > $40 and angle < $C0) and angle != $80)
		exit;
	
	var _quadrant	= global.angle_data[angle].quad_wall;

	// Set y-offset of push sensor if on flat ground (angle < 11.25 or angle > 348.75).
	// Fixed for rolling
	var _y_offset	= (angle < 8 or angle > $F8) ? (spinning ? 3 : 8) : 0;

	var _chk_angle, _dist;
	
	// If moving right, find walls to your right.
	if (inertia > 0)
	{
		_chk_angle = angle - $40;
		_dist = gfunc_get_right_wall_dist(push+1, _y_offset, _quadrant);
	}
		
	// If moving left, find walls to your left.
	else if (inertia < 0)
	{
		_chk_angle = angle + $40;
		_dist = gfunc_get_left_wall_dist(-(push+1), _y_offset, _quadrant);
	}
	
	if (_dist < 0)
	{
		switch(floor(gfunc_wrap_angle(_chk_angle + $20) / $40))
		{
			// Not sure why, but if I don't accomodate for 1, it pops in and out of the wall.
			
			// Running downwards
			case 0:
				y_pos += _dist+1;
				ysp = 0;
				inertia = 0;		// Fixes wall grinding bug
			break;
			// Running left
			case 1:
				x_pos -= _dist+1;
				xsp = 0;
				pushing = true;
				inertia = 0;
			break;
			// Running upwards
			case 2:
				y_pos -= _dist+1;
				ysp = 0;
				inertia = 0;		// Fixes wall grinding bug
			break;
			// Running right
			case 3:
				x_pos += _dist+1;
				xsp = 0;
				pushing = true;
				inertia = 0;
			break;
		}
	}
}