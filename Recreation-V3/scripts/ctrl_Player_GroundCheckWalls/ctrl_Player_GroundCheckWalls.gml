function ctrl_Player_GroundCheckWalls(){
	var _angle = global.angle_data[angle].angle;
	
	// Exit if not moving, or if angle is too steep and not a cardinal one (90, 180, 270)
	if inertia == 0 or ((_angle > 90 and _angle < 270) and _angle != 180)
		exit;

	var _quadrant = global.angle_data[angle].quad_wall;
	
	// Collide with walls on the left
	if inertia < 0 {
		switch(_quadrant) {
			case COL_FLOOR:
			{
				// Lower wall sensors by 8 pixels on a flat-ish floor
				var sen_y = (_angle < 11.25 || _angle > 348.75) ? 8 : 0;

				var _dist = gfunc_gameobj_find_tile(x - width, y + sen_y, col_layer, -1, _quadrant, true)[0];
				if  _dist < 0 
				{
					// Push player to the right
					x		-= _dist;
					xsp		= 0;
					inertia	= 0;
					
					// Set pushing flag
					if flipped and !spinning
						pushing = true;
				}
			}
			break;
			
			case COL_WALL_R:
			{
				var _dist = gfunc_gameobj_find_tile(x, y + width, col_layer, 1, _quadrant, true)[0];
				if  _dist < 0
				{
					y		+= _dist;
					ysp		= 0;
					inertia	= 0;
				}
			}
			break;
			
			case COL_CEILING:
			{
				var _dist = gfunc_gameobj_find_tile(x + width, y, col_layer, 1, _quadrant, true)[0];
				if  _dist < 0
				{	
					x		+= _dist;
					xsp		= 0
					inertia = 0;
				}
			}
			break;
			
			case COL_WALL_L:
			{
				var _dist = gfunc_gameobj_find_tile(x, y - width, col_layer, -1, _quadrant, true)[0];
				if  _dist < 0
				{	
					y		-= _dist;
					ysp		= 0;
					inertia = 0;
				}
			}
			break;
		}
	}
	
	// Collide with walls on the right
	else if inertia > 0 {
		switch(_quadrant) {
			case COL_FLOOR:
			{
				// Lower wall sensors by 8 pixels on a flat-ish floor
				var sen_y = (_angle < 11.25 || _angle > 348.75) ? 8 : 0;

				var _dist = gfunc_gameobj_find_tile(x + width, y + sen_y, col_layer, 1, _quadrant, true)[0];
				if  _dist < 0
				{	
					x		+= _dist;
					xsp		= 0;
					inertia	= 0;
					
					// Set pushing flag
					if !flipped and !spinning
						pushing = true;
				}
			}
			break;
			
			case COL_WALL_R:
			{
				var _dist = gfunc_gameobj_find_tile(x, y - width, col_layer, -1, _quadrant, true)[0];
				if  _dist < 0
				{	
					y		-= _dist;
					ysp		= 0;
					inertia	= 0;
				}
			}
			break;
			
			case COL_CEILING:
			{
				var _dist = gfunc_gameobj_find_tile(x - width, y, col_layer, -1, _quadrant, true)[0];
				if  _dist < 0
				{	
					x		-= _dist;
					xsp		= 0;
					inertia = 0;
				}
			}
			break;
			
			case COL_WALL_L:
			{
				var _dist = gfunc_gameobj_find_tile(x, y + width, col_layer, 1, _quadrant, true)[0];
				if  _dist < 0
				{	
					y		+= _dist;
					ysp		= 0;
					inertia	= 0;
				}
			}
			break;
		}
	}
}