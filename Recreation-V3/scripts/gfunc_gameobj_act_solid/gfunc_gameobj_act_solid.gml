// If player is standing on this object, collide only with its top side
function gfunc_gameobj_act_solid(_width, _height, _height_air, _prev_x, _sides, _top, _bottom) {
	// Don't collide if dead
	if cPLAYER.routine > 2	return 0;
	
	if _top {
		// First, check if the Player is standing on the object.
		if (cPLAYER.on_obj and cPLAYER.platform_id == id)
		{
			var _total_x_radius = _width + cPLAYER.width + 1;
			var _comp_x = (cPLAYER.x - x) + _total_x_radius; // get the position difference
			if(cPLAYER.in_air || _comp_x < 0 || _comp_x >= _total_x_radius*2)
			{
				solid_exit_platform();
				return 0; // Register no collision
			}
			else
			{
				solid_move_player(cPLAYER, _height, _prev_x);
				return 1; // Register top collision
			}
		}
		// If not, proceed with checking for collision, assuming top-solidity
		else return solid_obj_collide(_width, _height_air, _prev_x, _sides, true, _bottom);
	}
	// Proceed with checking for collision, assuming no top-solidity
	else return solid_obj_collide(_width, _height_air, _prev_x, _sides, false, _bottom);
}

function gfunc_monitor_act_solid(_width, _height, _height_air, _prev_x, _sides, _top) {
	// Don't collide if dead or in a ball
	if (cPLAYER.routine > 2 or cPLAYER.spinning)	return 0;
	
	if _top {
		if (cPLAYER.on_obj and cPLAYER.platform_id == id)
		{
			var _total_x_radius = _width + cPLAYER.width + 1;
			var _comp_x = (cPLAYER.x - x) + _total_x_radius; // get the position difference
			if(cPLAYER.in_air || _comp_x < 0 || _comp_x >= _total_x_radius*2)
			{
				solid_exit_platform();
				return 0; // Register no collision
			}
			else
			{
				solid_move_player(cPLAYER, _height, _prev_x);
				return 1; // Register top collision
			}
		}
		else return solid_monitor_collide(_width, _height_air, _prev_x, _sides, true);
	}
	else return solid_monitor_collide(_width, _height_air, _prev_x, _sides, false);
}

// Move player with the object (Will only apply to moving solids)
function solid_move_player(_p, _height, _prev_x){
	if _p.routine != 1 exit; // Only collide in the main routine
	
	var _top	= y - _height - 1;
	_p.y		= _top - _p.height;
	_p.x		-= (_prev_x - x);
}

// Fall off the solid object (Feels slightly wonky, but it works)
function solid_exit_platform(){
	cPLAYER.on_obj		= false;
	cPLAYER.platform_id	= noone;
	on_obj				= false;
	cPLAYER.in_air		= true;
}

// Solid object collision
function solid_obj_collide(_width, _height, _prev_x, _sides, _top, _bottom) {
	var _px = cPLAYER.x,	_py = cPLAYER.y;

	// First, the Player will check if they are overlapping the object on the x-axis.
	var _total_x_radius = _width + cPLAYER.width_push+1;
	var _left_diff = (_px - x) + _total_x_radius;						// difference between the Player's X Position and the left edge of the combined box.
	if (_left_diff < 0) or (_left_diff > _total_x_radius*2)	return 0;	// if too far to the left OR right, no collision
	
	// Then, check for an overlap on the y-axis (extend the top of the object 4 pixels for extra overlap. This is subtracted later).
	var _total_y_radius = _height + cPLAYER.height+1;
	var _top_diff = (_py - y) + 4 + _total_y_radius;					// difference between the Player's Y Position and the top edge of the combined box.
	if (_top_diff < 0) or (_top_diff > _total_y_radius*2) return 0;		// if (_top_diff < 0) = too far above; if (_top_diff > _total_y_radius*2) = too far below

	// If overlapping, both distances MUST be 0 or positive, and within the diameter
	// The Player will decide which side of the object they are nearest to on both axis (either left or right and either top or bottom).
	var _dist_x, _dist_y;

	if (_px > x)					// If player is to the right of object (negative value)
		_dist_x = _left_diff - _total_x_radius*2;
	else							// If player is to the left of object (positive value)
		_dist_x = _left_diff;
	var _clip_x = abs(_dist_x);		// # of pixels player is within the object
		
	if (_py > y)					// If player is under the object (negative value)
		_dist_y = _top_diff - 4	- _total_y_radius*2;
	else							// If player is on top of the object (positive value)
		_dist_y = _top_diff;
	var _clip_y = abs(_dist_y);		// # of pixels player is within the object

	// Then check how close in pixels they are to being outside of the object on that side (left/right = clip_x & top/bottom = clip_y).
	// The game then decides whether they're closer to a horizontal side to be pushed out on the x axis or a vertical side to be pushed out on y axis.
	// This is done in the next line with a simple comparison check.

	// ACTUAL COLLISION AND STOPPING (The second check is a S3K check)
	if (_clip_x > _clip_y) or (_clip_y <= 4) {	// If our horizontal distance is greater than the vertical distance, we collide vertically.
		// Collide vertically

		// Check for landing on top of the object
		if (_dist_y >= 0 and _top) {
			// Collision only occurs within 16 pixels
			if (_dist_y < 16) {
				
				// First, get a distance from the Player's X Position to the object's right edge.
				var x_comp = _prev_x + _width - _px;
				
				// check this comparison to tell if the Player is within the x boundaries
				if ((x_comp >= 0 and x_comp < (_width*2)) and cPLAYER.ysp >= 0) {
					// Land on the object
					_dist_y -= 4;				// Subtract the 4 extra pixels from before
					cPLAYER.y -= _dist_y;
					cPLAYER.angle = 0;
					cPLAYER.angle_data = global.angle_data[0];
					cPLAYER.ysp = 0;
					cPLAYER.inertia = cPLAYER.xsp;
					with(cPLAYER) ctrl_Player_AcquireFloor();
					cPLAYER.platform_id = id;
					cPLAYER.on_obj = true;
					on_obj = true;
					return 1; // Register top collision
				} // Otherwise, the player will just slip off the side and keep falling
			}
			return 0; // Register no collision
		}

		// Check for hitting the bottom
		else if _bottom {
			// check if the Player is moving vertically
			if (cPLAYER.ysp != 0) {
				// if the Player is moving upward toward the object, push downward
				if (cPLAYER.ysp < 0 and _dist_y < 0) {
					cPLAYER.y -= _dist_y;
					cPLAYER.ysp = 0;
				}
				return 2; // Register bottom collision
			}

			// if NOT moving vertically, check for being crushed
			else {
				if !(cPLAYER.in_air) {
					if _clip_x >= 12 { // Changed this from 16
						ctrl_Player_Death();
						return 2; // Register bottom collision
					}
				}
				else return 2; // Register bottom collision
			}
		}
	}
	
	// else -- Fallthrough > Check to collide horizontally
	if _sides {
		// Check the object's left side
		if (_dist_x > 0) {
			// Stop speed going towards object
			if (cPLAYER.xsp > 0) {
				cPLAYER.xsp		= 0;
				cPLAYER.inertia	= 0;
				if cINPUT.k_r_h {
					pushed			= true;
					cPLAYER.pushing	= true;
				}
			}
		}

		// Check the object's right side
		else if (_dist_x < 0) {
			// Stop speed going towards object
			if (cPLAYER.xsp < 0) {
				cPLAYER.xsp		= 0;
				cPLAYER.inertia	= 0;
				if cINPUT.k_l_h {
					pushed			= true;
					cPLAYER.pushing	= true;
				}
			}
		}

		// Clip and change push flags
		cPLAYER.x -= _dist_x;
		if (cPLAYER.in_air) {
			// Mid-air or near edges, clear push flags
			pushed			= false;
			cPLAYER.pushing	= false;
		}

		return (_dist_x > 0) ? 3 : 4; // Register Side Collision (Left side is 3, Right side is 4)
	}

	return 0; // Register no collision
}

// Monitor collision
function solid_monitor_collide(_width, _height, _prev_x, _sides, _top) {
	var _px = cPLAYER.x,	_py = cPLAYER.y;

	// First, the Player will check if they are overlapping the object on the x-axis.
	var _total_x_radius = _width + cPLAYER.width_push+1;
	var _left_diff = (_px - x) + _total_x_radius;						// difference between the Player's X Position and the left edge of the combined box.
	if (_left_diff < 0) or (_left_diff > _total_x_radius*2)	return 0;	// if too far to the left OR right, no collision
	
	// Then, check for an overlap on the y-axis (The only difference here is that 4 is not added during the vertical overlap check).
	var _total_y_radius = _height + cPLAYER.height+1;
	var _top_diff = (_py - y) + _total_y_radius;						// difference between the Player's Y Position and the top edge of the combined box.
	if (_top_diff < 0) or (_top_diff > _total_y_radius*2) return 0;		// if (_top_diff < 0) = too far above; if (_top_diff > _total_y_radius*2) = too far below

	// If overlapping, both distances MUST be 0 or positive, and within the diameter
	// The Player will decide which side of the object they are nearest to on both axis (either left or right and either top or bottom).
	var _dist_x, _dist_y;

	if (_px > x)					// If player is to the right of object (negative value)
		_dist_x = _left_diff - _total_x_radius*2;
	else							// If player is to the left of object (positive value)
		_dist_x = _left_diff;
	var _clip_x = abs(_dist_x);		// # of pixels player is within the object
		
	if (_py > y)					// If player is under the object (negative value)
		_dist_y = _top_diff	- _total_y_radius*2;
	else							// If player is on top of the object (positive value)
		_dist_y = _top_diff;
	var _clip_y = abs(_dist_y);		// # of pixels player is within the object

	// Then check how close in pixels they are to being outside of the object on that side (left/right = clip_x & top/bottom = clip_y).
	// The game then decides whether they're closer to a horizontal side to be pushed out on the x axis or a vertical side to be pushed out on y axis.
	// This is done in the next line with a simple comparison check.

	// ACTUAL COLLISION AND STOPPING (The second check is a S3K check)
	if (_clip_x > _clip_y) or (_clip_y <= 4) {	// If our horizontal distance is greater than the vertical distance, we collide vertically.
		// Collide vertically

		// Check for landing on top of the object
		if (_dist_y >= 0 and _top) {
			// Collision only occurs within 16 pixels
			if (_dist_y < 16) {

				// First, get a distance from the Player's X Position to the monitor, plus 4 pixels of extra room either side
				var x_comp = _prev_x + 4 - _px;
				
				// check this comparison to tell if the Player is within the x boundaries
				if ((x_comp >= 0 and x_comp < (4*2)) and cPLAYER.ysp >= 0) {
					// Land on the object
					cPLAYER.y -= _dist_y;
					cPLAYER.angle = 0;
					cPLAYER.angle_data = global.angle_data[0];
					cPLAYER.ysp = 0;
					cPLAYER.inertia = cPLAYER.xsp;
					with(cPLAYER) ctrl_Player_AcquireFloor();
					cPLAYER.platform_id = id;
					cPLAYER.on_obj = true;
					on_obj = true;
					return 1; // Register top collision
				} // Otherwise, the player will just slip off the side and keep falling
			}
			return 0; // Register no collision
		}
		
		// Monitors do NOT have bottom solidity collision
	}
	
	// else -- Fallthrough > Check to collide horizontally
	if _sides {
		// Check the object's left side
		if (_dist_x > 0) {
			// Stop speed going towards object
			if (cPLAYER.xsp > 0) {
				cPLAYER.xsp		= 0;
				cPLAYER.inertia	= 0;
				if cINPUT.k_r_h {
					pushed			= true;
					cPLAYER.pushing	= true;
				}
			}
		}

		// Check the object's right side
		else if (_dist_x < 0) {
			// Stop speed going towards object
			if (cPLAYER.xsp < 0) {
				cPLAYER.xsp		= 0;
				cPLAYER.inertia	= 0;
				if cINPUT.k_l_h {
					pushed			= true;
					cPLAYER.pushing	= true;
				}
			}
		}

		// Clip and change push flags
		cPLAYER.x -= _dist_x;
		if (cPLAYER.in_air) {
			// Mid-air or near edges, clear push flags
			pushed			= false;
			cPLAYER.pushing	= false;
		}

		return (_dist_x > 0) ? 3 : 4; // Register Side Collision (Left side is 3, Right side is 4)
	}

	return 0; // Register no collision
}
