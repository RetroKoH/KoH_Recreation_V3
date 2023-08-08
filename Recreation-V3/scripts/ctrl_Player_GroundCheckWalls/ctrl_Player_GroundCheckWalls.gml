///@function ctrl_Player_GroundCheckWalls()
function ctrl_Player_GroundCheckWalls() {
	var _angle = global.angle_data[angle].angle;
	
	// Exit if not moving, or if angle is too steep and not a cardinal one (90, 180, 270)
	if inertia == 0 or ((_angle > 90 and _angle < 270) and _angle != 180)
		exit;
	
	// Get collision quadrant
	var _quadrant	= global.angle_data[angle].quad_wall;
	var _dir		= sign(inertia);
	var _x			= floor(x);
	var _y			= floor(y);
	
	switch(_quadrant) {
		case COL_FLOOR:
		{
			// Lower wall sensors by 8 pixels on a flat-ish floor
			var _sen_y	= (_angle < 11.25 || _angle > 348.75) ? 8 : 0;
			var _dist	= gfunc_gameobj_find_tile(_x + width * _dir, _y + _sen_y, col_layer, _dir, _quadrant, true)[0];
						//gfunc_gameobj_find_tile(_x - width,        _y + _sen_y, col_layer,   -1, _quadrant, true)[0]; LEFT (dir = -1)
						//gfunc_gameobj_find_tile(_x + width,        _y + _sen_y, col_layer,    1, _quadrant, true)[0]; RIGHT (dir = 1)
			
			if _dist < 0 {
				// Push the player out of the wall.
				x		+= _dist * _dir;	// left: x += _dist; right: x -= _dist
				// x += -9 * -1 = x+=9 (LEFT)
				// x += -9 * 1 = x-=9 (RIGHT)
				xsp		= 0;
				inertia	= 0;
			}
			
		}
		break;
		
		case COL_WALL_R:
		{
			var _dist	= gfunc_gameobj_find_tile(_x, _y - width * _dir, col_layer, -_dir, _quadrant, true)[0];
						//gfunc_gameobj_find_tile(_x, _y + width,        col_layer,     1, _quadrant, true)[0]; LEFT (dir = -1)
						//gfunc_gameobj_find_tile(_x, _y - width,        col_layer,    -1, _quadrant, true)[0]; RIGHT (dir = 1)
			
			if _dist < 0 {
				// Push the player out of the wall.
				y		-= _dist * _dir;	// left: y += _dist; right: y -= _dist
				// y -= -9 * -1 = y-=9 (LEFT)
				// y -= -9 * 1 = y+=9 (RIGHT)
				ysp		= 0;
				inertia	= 0;
			}
		}
		break;
		
		case COL_CEILING:
		{
			var _dist	= gfunc_gameobj_find_tile(_x - width * _dir, _y, col_layer, -_dir, _quadrant, true)[0];
						//gfunc_gameobj_find_tile(_x + width,        _y, col_layer,     1, _quadrant, true)[0]; LEFT (dir = -1)
						//gfunc_gameobj_find_tile(_x - width,        _y, col_layer,    -1, _quadrant, true)[0]; RIGHT (dir = 1)
			
			if _dist < 0 {
				// Push the player out of the wall.
				x		-= _dist * _dir;	// left: x += _dist; right: x += _dist
				// x -= -9 * -1 = x-=9 (LEFT)
				// x -= -9 * 1 = x+=9 (RIGHT)
				xsp		= 0;
				inertia	= 0;
			}
		}
		break;
		
		case COL_WALL_L:
			var _dist	= gfunc_gameobj_find_tile(_x, _y + width * _dir, col_layer, _dir, _quadrant, true)[0];
						//gfunc_gameobj_find_tile(_x, _y - width,        col_layer,    -1, _quadrant, true)[0]; LEFT (dir = -1)
						//gfunc_gameobj_find_tile(_x, _y + width,        col_layer,     1, _quadrant, true)[0]; RIGHT (dir = 1)
				
			if _dist < 0 {
				// Push the player out of the wall.
				y		+= _dist * _dir;	// left: y += _dist; right: y -= _dist
				// y += -9 * -1 = y+=9 (LEFT)
				// y += -9 * 1 = y-=9 (RIGHT)
				ysp		= 0;
				inertia	= 0;
			}
		break;
	}
}