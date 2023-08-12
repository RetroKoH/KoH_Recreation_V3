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
			var fall_dist;
			if ((_quadrant & 1) == 0)
				fall_dist = abs(xsp) + 4;
			
			else
				fall_dist = abs(ysp) + 4;
            
			if (fall_dist > 14)
                fall_dist = 14;
 
            if (_dist_real > fall_dist)
            {
			    in_air = true; // Set air flag
			    //angle = 0; //scrSetAngle(gravity_angle); Remove this to allow player to rotate in air
            }
            else
				collided = true;
        }
        else if (_dist_real < 0) // && dist_real > -14) <- Disabling this fixes a bug with angles
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