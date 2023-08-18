// If player is standing on this object, collide only with its top side
function gfunc_gameobj_act_solid(_width, _height, _height_air, _prev_x, _sides, _top, _bottom) {
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
	else return solid_obj_collide(_width, _height_air, _prev_x, _sides, false, _bottom);
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
	var _overlap = false;
	var _px = cPLAYER.x, _py = cPLAYER.y;
	var _total_x_radius = _width + cPLAYER.width + 1;
	var _left_diff = (_px - x) + _total_x_radius;

	if (_left_diff >= 0) and (_left_diff <= _total_x_radius*2) // if (_left_diff < 0) = too far to the left; (_left_diff > combined_x_radius*2) = too far to the right
	{	// We are overlapping on the x axis, check y axis
		var _total_y_radius = _height + cPLAYER.height;
		var _top_diff = (_py - y) + 4 + _total_y_radius;

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
			_dist_y = _top_diff - 4 - _total_y_radius*2;
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
							with(cPLAYER) ctrl_Player_Hurt(true, false);
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
			return 3; // Register Side Collision
		}
	}
	return 0; // Register no collision
}

///@ function gfunc_gameobj_act_solid(sideCollide, topCollide, bottomCollide, resetActions)
//function gfunc_gameobj_act_solid(_sides, _top, _bottom, _reset){
	/* Imported from Orbinaut Framework
	The following is long and replicates the original method of colliding with an object, 
	however, it was tweaked in several places to make collision much more consistent */
/*	
	// Clear flags
	collide_top		= false;
	collide_bottom	= false;
	collide_left	= false;
	collide_right	= false;
	collide_push	= false;
	
	// Exit if there is no side to collide with
	if !_sides and !_top and !_bottom
		exit;
	
	// Exit if the object's solid radiuses are null
	if !solid_width or !solid_height
		exit;
	
	// Exit if the object is off-screen
	if !gfunc_gameobj_onscreen()
		exit;
	
	// Get object and player data
	var _pl_x		= floor(cPLAYER.x);
	var _pl_y		= floor(cPLAYER.y);
	var _act_width	= solid_width + cPLAYER.width + 1;
	var _act_height	= solid_height + cPLAYER.height + 1;

	var _slope_off	= 0;
	
	// If player is standing on this object, collide only with its top side
	if cPLAYER.on_obj == id {	
		cPLAYER.x += floor(x - xprevious);
		cPLAYER.y  = y - solid_height - cPLAYER.height + _slope_off - 1;
			
		// Tell the object player touches its top side
		collide_top = true;
		
		// Check if player is outside the object
		var _fall_radius = _sides ? _act_width : solid_width + 1;
		
		// Lose the object
		var _diff_x  = floor(_pl_x) - x + _fall_radius;
		if  _diff_x <= 0 or _diff_x >= _fall_radius * 2 - 1
		{
			var _this = object_index;
			with cPLAYER
			{
				/*if Animation == AnimMove and ThisObject != Bridge
				{
					// Restart animation...?
					animation_reset(0);
				}*/
			/*	on_obj = false;
			}
		}
	}
	
	// If player is not standing on this object, collide with it