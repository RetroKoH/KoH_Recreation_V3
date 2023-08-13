function ctrl_Player_AnglePos() {

	if (on_obj) {
		angle = 0;	// Set flat angle if standing on an object.
	    exit;
	}
	
	// Otherwise, find tiles along the ground the player is on
	else {
		var _quadrant	= global.angle_data[angle].quad_floor;
		var _tile_left	= gfunc_collide_dist_floor(-width, height, _quadrant);
		var _tile_right	= gfunc_collide_dist_floor(width, height, _quadrant);
		var _dist_real, _angle_real;
	
		// Get shortest distance and set angle
	    if (_tile_left[0] < _tile_right[0]) {
			_dist_real	= _tile_left[0];
			_angle_real	= _tile_left[1];
		}
		else {
			_dist_real	= _tile_right[0];
			_angle_real	= _tile_right[1];
		}
		
		// FINISH THIS:
		// Check wall latching and set angle (Use lookup table??)
        if (abs(gfunc_get_signed_angle(gfunc_wrap_angle(_angle_real - angle))) >= $20)
            angle = floor(gfunc_wrap_angle(angle + $20) / $40) * $40;
        else
            angle = _angle_real;
		
		// Check distance
		var collided = false;
        if (_dist_real > 0)
        {
			// S2 Floor Collision
			var _fall_dist;
			if ((_quadrant & 1) == 0)
				_fall_dist = min(abs(xsp) + 4, 14); // FLOOR and CEILING

			else
				_fall_dist = min(abs(ysp) + 4, 14); // WALLS
 
			if (_dist_real > _fall_dist) {
				in_air = true;		// Put into the air
				pushing = false;
			}

            else
				collided = true;
        }
        
		
		else if (_dist_real < 0 and _dist_real > -14)
			collided = true;
		
		// Check if we should align with the floor
		if (collided)
		{
			if ((_quadrant & 1) == 0)
				y += _dist_real * ((_quadrant > 1) ? -1 : 1);

			else
				x += _dist_real * ((_quadrant > 1) ? -1 : 1);
		}
		
		// Round position down to integer (The original games do not do this!)
		if ((_quadrant & 1) == 0)
			y = floor(y);
		else
			x = floor(x);
	}
}