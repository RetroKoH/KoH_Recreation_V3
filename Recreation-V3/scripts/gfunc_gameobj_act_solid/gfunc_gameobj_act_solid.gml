// If player is standing on this object, collide only with its top side
function gfunc_gameobj_act_solid(_width, _height, _height_air, _prev_x, _sides, _top, _bottom) {
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

function gfunc_monitor_act_solid(_width, _height, _height_air, _prev_x, _sides, _top, _bottom) {
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
		else return solid_obj_collide(_width, _height_air, _prev_x, _sides, true, _bottom);
	}
	else return solid_monitor_collide(_width, _height_air, _prev_x, _sides, false, _bottom);
}

// Move player with the object (Will only apply to moving solids)
function solid_move_player(_p, _height, _prev_x){
	if _p.routine != 1 exit; // Only collide in the main routine
	
	var _top	= y - _height - 1;
	_p.y		= _top - _p.height;
	_p.x		-= (_prev_x - x)
}

// Fall off the solid object (Feels slightly wonky, but it works)
function solid_exit_platform(){
	cPLAYER.on_obj		= false;
	cPLAYER.platform_id	= noone;
	on_obj				= false;
	cPLAYER.in_air		= true;
}

// Solid object collision
function solid_obj_collide(_width, _height, _prev_x, _sides, _top, _bottom){
	var _overlap = false,	_px = cPLAYER.x,	_py = cPLAYER.y,	_total_x_radius = _width + cPLAYER.width_push+1;

	// First, the Player will check if they are overlapping the object.
	var _left_diff = (_px - x) + _total_x_radius;
	
	// IF the Player is overlapping on the x-axis, check the y-axis
	if (_left_diff >= 0) and (_left_diff <= _total_x_radius*2) { // if (_left_diff < 0) = too far to the left; (_left_diff > combined_x_radius*2) = too far to the right
		var _total_y_radius = _height + cPLAYER.height;
		var _top_diff = (_py - y) + 4 + _total_y_radius;

		if ((_top_diff >= 0) and (_top_diff <= _total_y_radius*2)) _overlap=true; // if (_top_diff < 0) = too far above; if (_top_diff > _total_y_radius*2) = too far below
	}

	// If overlappping, both distances MUST be 0 or positive, and within the diameter
	// The Player will decide which side of the object they are nearest to on both axis (either left or right and either top or bottom).
	if _overlap and (cPLAYER.routine < 3) {
		var _dist_x, _dist_y;

		if (_px > x) // If player is to the right of object (negative value)
			_dist_x = _left_diff - _total_x_radius*2;
		else // If player is to the left of object (positive value)
			_dist_x = _left_diff;
		var _clip_x = abs(_dist_x);
		
		if (_py > y) // If player is on the bottom (negative value)
			_dist_y = _top_diff - 4 - _total_y_radius*2;
		else // If player is on the top (positive value)
			_dist_y = _top_diff;
		var _clip_y = abs(_dist_y);
		// Then check how close in pixels they are to being outside of the object on that side (left/right = clip_x & top/bottom = clip_y).
		// The game then decides whether they're closer to a horizontal side to be pushed out on the x axis or a vertical side to be pushed out on y axis.
		// This is done in the next line with a simple comparison check.

		// ACTUAL COLLISION AND STOPPING
		if (_clip_x > _clip_y) // If our horizontal difference is greater than the vertical difference (we're above / below the object)
		{
			// Collide vertically
			if (_dist_y >= 0 and _top)
			{
				// Check for landing on object
				if (_dist_y < 16)
				{
					var x_comp = _prev_x + _width - _px;
					if ((x_comp >= 0 && x_comp < (_width*2)) && cPLAYER.ysp >= 0)
					{
						// Land on the object
						_dist_y -= 4;	
						cPLAYER.y -= (_dist_y + 1);
						cPLAYER.angle = 0;
						cPLAYER.ysp = 0;
						cPLAYER.inertia = cPLAYER.xsp;
						with(cPLAYER) ctrl_Player_AcquireFloor();
						cPLAYER.platform_id = id;
						cPLAYER.on_obj = true;
						on_obj = true;
						return 1; // Register top collision
					}
				}
				return 0; // Register no collision
			}
			else if _bottom
			{
				// Check for hitting the bottom
				if (cPLAYER.ysp != 0)
				{
					if (cPLAYER.ysp < 0 && _dist_y < 0)
					{
						cPLAYER.y -= _dist_y;
						cPLAYER.ysp = 0;
					}
					return 2; // Register bottom collision
				}
				else
				{
					if !(cPLAYER.in_air)
					{
						if abs(_clip_x) >= 12 // Changed this from 16
						{
							ctrl_Player_Death();
							return 2; // Register bottom collision
						}
					}
					else return 2; // Register bottom collision
				}
			}
		}
		if _sides //else // Fallthrough
		{
			// Collide horizontally
			if (_clip_y > 4)
			{
				// Stop speed going towards object
				if (_dist_x > 0)
				{
					if (cPLAYER.xsp > 0)
					{
						cPLAYER.xsp=0;
						cPLAYER.inertia=0;
						if cINPUT.k_r_h {
							pushed = true;
							cPLAYER.pushing = true;
						}
					}
				}
				else if (_dist_x < 0)
				{
					if (cPLAYER.xsp < 0)
					{
						cPLAYER.xsp=0;
						cPLAYER.inertia=0;
						if cINPUT.k_l_h {
							pushed = true;
							cPLAYER.pushing = true;
						}
					}
				}
				// Clip and change push flags
				cPLAYER.x -= _dist_x;
				if (cPLAYER.in_air) {
					// Mid-air or near edges, clear push flags
					pushed = false;
					cPLAYER.pushing = false;
				}
			}
			return (_dist_x > 0) ? 3 : 4; // Register Side Collision (Left side is 3, Right side is 4)
		}
	}
	return 0; // Register no collision
}

// Monitor collision
function solid_monitor_collide(_width, _height, _prev_x, _sides, _top, _bottom){
	var _overlap = false;
	var _px = cPLAYER.x, _py = cPLAYER.y;
	var _total_x_radius = _width + cPLAYER.width + 1;
	var _left_diff = (_px - x) + _total_x_radius;

	if (_left_diff >= 0) and (_left_diff <= _total_x_radius*2) // if (_left_diff < 0) = too far to the left; (_left_diff > combined_x_radius*2) = too far to the right
	{	// We are overlapping on the x axis, check y axis
		var _total_y_radius = _height + cPLAYER.height;
		var _top_diff = (_py - y) + _total_y_radius; // CHANGE: 4 is no longer added to the overlap check

		if ((_top_diff >= 0) && (_top_diff <= _total_y_radius*2)) _overlap=true; // if (_top_diff < 0) = too far above; if (_top_diff > _total_y_radius*2) = too far below
	}

	// If overlap is true, both distances MUST be 0 or positive, and within the diameter
	if _overlap and (cPLAYER.routine < 3) { // 3 = Death routine
		var _dist_x, _dist_y;
		if (_px > x) // If player is to the right of object (negative value)
			_dist_x = _left_diff - _total_x_radius*2;
		else // If player is to the left of object (positive value)
			_dist_x = _left_diff;
		var _clip_x = abs(_dist_x);
		
		if (_py > y) // If player is on the bottom (negative value)
			_dist_y = _top_diff - _total_y_radius*2;			// CHANGE: 4 is no longer added to overlap
		else // If player is on the top (positive value)
			_dist_y = _top_diff;
		var _clip_y = abs(_dist_y);

		// ACTUAL COLLISION AND STOPPING
		if (_clip_x > _clip_y) // If our horizontal difference is greater than the vertical difference (we're above / below the object)
		{
			// Collide vertically
			if (_dist_y >= 0 and _top)
			{
				// Check for landing on object
				if (_dist_y < 16)
				{
					var x_comp = _prev_x + _width - _px;
					if ((x_comp >= 0 && x_comp < (_width*2)) && cPLAYER.ysp >= 0)
					{
						// Land on the object
						//_dist_y -= 4;		; CHANGE: 4 is no longer added to the overlap check
						cPLAYER.y -= (_dist_y + 1);
						cPLAYER.angle = 0;
						cPLAYER.ysp = 0;
						cPLAYER.inertia = cPLAYER.xsp;
						with(cPLAYER) ctrl_Player_AcquireFloor();
						cPLAYER.platform_id = id;
						cPLAYER.on_obj = true;
						on_obj = true;
						return 1; // Register top collision
					}
				}
				return 0; // Register no collision
			}
			else if _bottom
			{
				// Check for hitting the bottom
				if (cPLAYER.ysp != 0)
				{
					if (cPLAYER.ysp < 0 && _dist_y < 0)
					{
						cPLAYER.y -= _dist_y;
						cPLAYER.ysp = 0;
					}
					return 2; // Register bottom collision
				}
				/*else
				{
					if !(cPLAYER.in_air)
					{
						if abs(_clip_x) >= 12 // Changed this from 16
						{
							ctrl_Player_Death();
							return 2; // Register bottom collision
						}
					}
					else return 2; // Register bottom collision
				}*/
			}
		}
		if _sides //else // Fallthrough
		{
			// Collide horizontally
			if (_clip_y > 4)
			{
				// Stop speed going towards object
				if (_dist_x > 0)
				{
					if (cPLAYER.xsp > 0)
					{
						cPLAYER.xsp=0;
						cPLAYER.inertia=0;
						if cINPUT.k_r_h {
							pushed = true;
							cPLAYER.pushing = true;
						}
					}
				}
				else if (_dist_x < 0)
				{
					if (cPLAYER.xsp < 0)
					{
						cPLAYER.xsp=0;
						cPLAYER.inertia=0;
						if cINPUT.k_l_h {
							pushed = true;
							cPLAYER.pushing = true;
						}
					}
				}
				// Clip and change push flags
				cPLAYER.x -= _dist_x;
				if (cPLAYER.in_air) {
					// Mid-air or near edges, clear push flags
					pushed = false;
					cPLAYER.pushing = false;
				}
			}
			return (_dist_x > 0) ? 3 : 4; // Register Side Collision (Left side is 3, Right side is 4)
		}
	}
	return 0; // Register no collision
}
