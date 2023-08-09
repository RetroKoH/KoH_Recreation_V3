///@function ctrl_Player_GroundCheckWalls()
function ctrl_Player_GroundCheckWalls() {
	var _angle = global.angle_data[angle].angle;
	
	// Exit if not moving, or if angle is too steep and not a cardinal one (90, 180, 270)
	if inertia == 0 or ((_angle > 90 and _angle < 270) and _angle != 180)
		exit;
	
	// Get collision quadrant
	var _quadrant	= global.angle_data[angle].quad_wall;
	var _dir		= sign(inertia);
	var _x			= (x);
	var _y			= (y);
	
	switch(_quadrant) {
		case COL_FLOOR:
		{
			// Lower wall sensors by 8 pixels on a flat-ish floor
			var _sen_y	= (_angle < 11.25 || _angle > 348.75) ? 8 : 0;
			var _dist	= gfunc_gameobj_find_tile(_x + push * _dir, _y + _sen_y, col_layer, _dir, _quadrant, true)[0];
			
			if _dist < 0 {
				// Push the player out of the wall.
				x		+= _dist * _dir;
				xsp		= 0;
				inertia	= 0;
			}
			
		}
		break;
		
		case COL_WALL_R:
		{
			var _dist	= gfunc_gameobj_find_tile(_x, _y - push * _dir, col_layer, -_dir, _quadrant, true)[0];
			if _dist < 0 {
				// Push the player out of the wall.
				y		-= _dist * _dir;
				ysp		= 0;
				inertia	= 0;
			}
		}
		break;
		
		case COL_CEILING:
		{
			var _dist	= gfunc_gameobj_find_tile(_x - push * _dir, _y, col_layer, -_dir, _quadrant, true)[0];
			
			if _dist < 0 {
				// Push the player out of the wall.
				x		-= _dist * _dir;
				xsp		= 0;
				inertia	= 0;
			}
		}
		break;
		
		case COL_WALL_L:
			var _dist	= gfunc_gameobj_find_tile(_x, _y + push * _dir, col_layer, _dir, _quadrant, true)[0];
				
			if _dist < 0 {
				// Push the player out of the wall.
				y		+= _dist * _dir;
				ysp		= 0;
				inertia	= 0;
			}
		break;
	}
}