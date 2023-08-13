function ctrl_Player_CheckFloor(){
	var _dir;
	// For some reason, certain tiles don't cooperate (flipped and mirrored)
	
	// Get quadrant of movement to handle collision
	if abs(xsp) >= abs(ysp)
		_dir = xsp > 0 ? COL_WALL_R : COL_WALL_L;
	else
		_dir = ysp > 0 ? COL_FLOOR : COL_CEILING;
	
	var _wall_dist, _dist_real, _angle_real;
	switch(_dir) {
		case COL_FLOOR:		// Mostly downward
		{
			// Check left wall collision (Wall Sensor E)
			_wall_dist = gfunc_collide_dist_leftwall(-width_push, 0, COL_FLOOR)[0];
			if (_wall_dist < 0) {
				x -= _wall_dist;
				xsp = 0;			// stop the player hitting a wall
			}

			// Check right wall collision (Wall Sensor F)
			_wall_dist = gfunc_collide_dist_rightwall(width_push, 0, COL_FLOOR)[0];
			if (_wall_dist < 0) {
				x += _wall_dist;
				xsp = 0;			// stop the player hitting a wall
			}

			// Check floor collision (Floor Sensors A/B)
			var _tile_left	= gfunc_collide_dist_floor(-width, height, COL_FLOOR);
			var _tile_right	= gfunc_collide_dist_floor(width, height, COL_FLOOR);
			var t_dir;
			
			// This time we need both distances.
			if _tile_left[0] <= _tile_right[0] {
				_dist_real	= _tile_left[0];
				_angle_real	= _tile_left[1];
				t_dir = "to the left";
			}
			else {
				_dist_real	= _tile_right[0];
				_angle_real	= _tile_right[1];
				t_dir = "to the right";
			}
			
			var _dist_chk = -(ysp + 8);
			if _dist_real < 0 and (_tile_left[0] >= _dist_chk or _tile_right[0] >= _dist_chk) {
				// Only hit the floor if we aren't too deep into it
				// (Allows us to fall through top solid blocks if we haven't quite cleared them)
				show_debug_message("Caught Floor "+t_dir+" in Floor Mode: "+string(y+height));
					
				y += _dist_real;
				angle = _angle_real;
				// This section recoded courtesy of Orbinaut Framework
				if (global.angle_data[angle].quad_floor != COL_FLOOR) {
					// Steep slope (If floor is greater than 45 degrees, use full vertical velocity (capped at 15.75))
					if ysp > 15.75
						ysp = 15.75;
					xsp = 0;
					inertia = angle < $80 ? -ysp : ysp;
				}
				else if angle > $10 and angle < $F0 {
					// Shallow slope (If floor is greater than 22.5 degrees, use halved vertical velocity)
					inertia = angle < $80 ? -ysp / 2 : ysp / 2;
				}
				else {
					// Flat floor (If floor is within 22.5 degrees, use horizontal velocity)
					ysp = 0;
					inertia = xsp;	
				}
				ctrl_Player_AcquireFloor();
			}
		}
		break;
		
		case COL_WALL_R:	// Mostly right
		{
			// Check right wall collision
			_wall_dist = gfunc_collide_dist_rightwall(width_push, 0, COL_FLOOR)[0];
			if (_wall_dist < 0) {
				x += _wall_dist;
				xsp = 0;
				inertia = ysp;
			}
			else {
				// Collide with the ceiling (Ceiling Sensors C/D)
				var _tile_left	= gfunc_collide_dist_ceiling(-width, -height, COL_FLOOR);
				var _tile_right	= gfunc_collide_dist_ceiling(width, -height, COL_FLOOR);
				
				// Compare distances and pick one.
				if _tile_left[0] <= _tile_right[0] {
					_dist_real	= _tile_left[0];
					_angle_real	= _tile_left[1];
				}
				else {
					_dist_real	= _tile_right[0];
					_angle_real	= _tile_right[1];
				}

				if (_dist_real < 0) {
					// Orbinaut doesn't emulate much of this. Need to double-check.
					if (_dist_real > -20) {
						// Only hit the ceiling if we aren't too deep into it
						y -= _dist_real;
						if (ysp < 0) ysp = 0;
					}
					else {
						// Check left wall collision
						_wall_dist = gfunc_collide_dist_leftwall(-width_push, 0, COL_FLOOR)[0];
						if (_wall_dist < 0) {
							x -= _wall_dist;
							xsp = 0;
						}
					}
				}

				else if ysp > 0 {
					// Check floor collision (Floor Sensors A/B)
					_tile_left	= gfunc_collide_dist_floor(-width, height, COL_FLOOR);
					_tile_right	= gfunc_collide_dist_floor(width, height, COL_FLOOR);
					var t_dir;
			
					// Compare distances and pick one.
					if _tile_left[0] <= _tile_right[0] {
						_dist_real	= _tile_left[0];
						_angle_real	= _tile_left[1];
						t_dir = "to the left";
					}
					else {
						_dist_real	= _tile_right[0];
						_angle_real	= _tile_right[1];
						t_dir = "to the right";
					}
					
					if (_dist_real < 0) {
						show_debug_message("Caught Floor "+t_dir+" in R.Wall Mode: "+string(y+height));
						y += _dist_real;
						angle = _angle_real;
						ysp = 0;
						inertia = xsp;
						ctrl_Player_AcquireFloor();
					}
				}
			}
		}
		break;
		
		case COL_CEILING:	// Mostly upward (Slightly Bugged)
		{
			// Check left wall collision (Wall Sensor E)
			_wall_dist = gfunc_collide_dist_leftwall(-width_push, 0, COL_FLOOR)[0];
			if (_wall_dist < 0) {
				x -= _wall_dist;
				xsp = 0;			// stop the player hitting a wall
			}

			// Check right wall collision (Wall Sensor F)
			_wall_dist = gfunc_collide_dist_rightwall(width_push, 0, COL_FLOOR)[0];
			if (_wall_dist < 0) {
				x += _wall_dist;
				xsp = 0;			// stop the player hitting a wall
			}
			
			// Collide with the ceiling (Ceiling Sensors C/D)
			var _tile_left	= gfunc_collide_dist_ceiling(-width, -height, COL_FLOOR);
			var _tile_right	= gfunc_collide_dist_ceiling(width, -height, COL_FLOOR);
			var t_dir;
				
			// Compare distances and pick one.
			if _tile_left[0] <= _tile_right[0] {
				_dist_real	= _tile_left[0];
				_angle_real	= _tile_left[1];
				t_dir = "to the left";
			}
			else {
				_dist_real	= _tile_right[0];
				_angle_real	= _tile_right[1];
				t_dir = "to the right";
			}
			
			if _dist_real < 0 {
				if (_angle_real > $40 and _angle_real <= $61) or (_angle_real > $A0 and _angle_real <= $BF) {
					// Land if the angle is steep enough
					show_debug_message("Caught Ceiling "+t_dir+" in Ceiling Mode: "+string(y-height));
					y -= _dist_real;
					angle	= _angle_real;
					inertia	= _angle_real < $80 ? -ysp : ysp;
					ctrl_Player_AcquireFloor();
				}
				else {
					show_debug_message("Bumped the Ceiling "+t_dir+" in Ceiling Mode: "+string(y-height));
					y -= _dist_real;
					ysp = 0;
				}
			}
		}
		break;
		
		case COL_WALL_L:	// Mostly left
		{
			// Check left wall collision
			_wall_dist = gfunc_collide_dist_leftwall(-width_push, 0, COL_FLOOR)[0];
			if (_wall_dist < 0) {
				x -= _wall_dist;
				xsp = 0;
				inertia = ysp;
			}
			else {
				// Collide with the ceiling (Ceiling Sensors C/D)
				var _tile_left	= gfunc_collide_dist_ceiling(-width, -height, COL_FLOOR);
				var _tile_right	= gfunc_collide_dist_ceiling(width, -height, COL_FLOOR);

				// Compare distances and pick one.
				if _tile_left[0] <= _tile_right[0] {
					_dist_real	= _tile_left[0];
					_angle_real	= _tile_left[1];
				}
				else {
					_dist_real	= _tile_right[0];
					_angle_real	= _tile_right[1];
				}
				
				if (_dist_real < 0) {
					// Orbinaut doesn't emulate much of this. Need to double-check.
					if (_dist_real > -20) {
						// Only hit the ceiling if we aren't too deep into it
						y -= _dist_real;
						if (ysp < 0) ysp = 0;
					}
					else {
						// Check right wall collision
						_wall_dist = gfunc_collide_dist_rightwall(width_push, 0, COL_FLOOR)[0];
						if (_wall_dist < 0) {
							x += _wall_dist;
							xsp = 0;
						}
					}
				}
				else if ysp > 0 {
					// Check floor collision (Floor Sensors A/B)
					var _tile_left	= gfunc_collide_dist_floor(-width, height, COL_FLOOR);
					var _tile_right	= gfunc_collide_dist_floor(width, height, COL_FLOOR);
					var t_dir;
			
					// Compare distances and pick one.
					if _tile_left[0] <= _tile_right[0] {
						_dist_real	= _tile_left[0];
						_angle_real	= _tile_left[1];
						t_dir = "to the left";
					}
					else {
						_dist_real	= _tile_right[0];
						_angle_real	= _tile_right[1];
						t_dir = "to the right";
					}
					
					if (_dist_real < 0) {
						show_debug_message("Caught Floor "+t_dir+" in L.Wall Mode: "+string(y-_dist_real));
						y += _dist_real;
						angle = _angle_real;
						ysp = 0;
						inertia = xsp;
						ctrl_Player_AcquireFloor();
					}
				}
			}
		}
		break;
	}
}