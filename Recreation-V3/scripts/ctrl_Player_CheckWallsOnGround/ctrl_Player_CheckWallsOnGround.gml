function ctrl_Player_CheckWallsOnGround(){	
	// Exit if not moving, or if angle is too steep and not a cardinal one (90, 180, 270)
	if inertia == 0 or ((angle > $40 and angle < $C0) and angle != $80)
		exit;

	// Otherwise, proceed and get distance from the wall.
	var _quadrant	= global.angle_data[angle].quad_wall;	// Get collision quadrant
	var _off_y		= (angle < 8 || angle > $F8) ? (!spinning ? 8 : 3) : 0;
	var _angle_check, _dist;
	
	// If moving right, find walls to your right.
	if (inertia > 0)
	{
		_angle_check = angle - $40;
		_dist = gfunc_collide_dist_rightwall(width_push, _off_y, _quadrant);
	}
	
	// If moving left, find walls to your left.
	else if (inertia < 0)
	{
		_angle_check = angle + $40;
		_dist = gfunc_collide_dist_leftwall(-width_push, _off_y, _quadrant);
	}
	
	// If player is within a wall
	if (_dist < 0) {
		switch(floor(gfunc_wrap_angle(_angle_check + $20) / $40))
		{
			// Running downwards
			case 0:
				y += _dist;
				ysp = 0;
				inertia = 0;		// Fixes wall grinding bug
			break;
			// Running left
			case 1:
				x -= _dist;
				xsp = 0;
				inertia = 0;
				
				pushing = true;
			break;
			// Running upwards
			case 2:
				y -= _dist;
				ysp = 0;
				inertia = 0;		// Fixes wall grinding bug
			break;
			// Running right
			case 3:
				x += _dist;
				xsp = 0;
				inertia = 0;
				
				pushing = true;
			break;
		}
	}
}