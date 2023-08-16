/// @description Routine handling

switch(routine) {
case 0:
	// Object initialization & resetting
	{
		routine++;
		routine_2	= 0;
		height		= 16;
		width		= 8;
		angle		= 0;
		path		= 0;
		time		= 60;
		
		// Set direction accordingly
		anim_direction = image_xscale;
		image_xscale = 1;
		
		move_dir = anim_direction;
		xsp = 0.5 * move_dir;
	}
	break;
	
	case 1:
	// Set position on the ground
	{
		gfunc_gameobj_apply_speed(true);
		var _dist = gfunc_collide_dist_floor(0, height, COL_FLOOR)[0];
		if _dist <= 0
		{
			routine++;
			y				+= _dist;
			anim_direction	*= -1;
			ysp				= 0;
		}
	}
	break;
	
	case 2:
	// General Action - Uses Secondary Routine (Rewritten; Credit to Orbinaut Framework)
	{
		switch(routine_2) {
			case 0:
			// Walk on the floor
			{
		        // Walk ahead, only turning IF there is no floor ahead
				if (--time)
		            gfunc_gameobj_apply_speed(false);
					
		            if time mod 2 == 0
						var _dist = gfunc_collide_dist_floor(width*sign(xsp), height, COL_FLOOR)[0];

					else
						var _tile = gfunc_collide_dist_floor(0, height, COL_FLOOR);
					
					// Increment state
					if time mod 2 == 0 or !time {
						if time mod 2 == 0 and !(_dist < -8 or _dist >= 12)
							break;
					
						if gfunc_gameobj_onscreen()
							routine_2 = 2;	// Fire missiles if onscreen
						
						else
							routine_2 = 1;	// Crabmeat should turn around
						
						time = 60;
						anim_ID = 0;
					}

					// Adhere to the surface
					else {
						// If surface is angled, update sprite
						if _tile[1] >= $06 and _tile[1] <= $FA {
							anim_direction = _tile[1] > $80 ? -move_dir : move_dir;
							anim_framemod = 3;
						}
						else {
							anim_direction = move_dir;
							anim_framemod = 0;
						}

						y += _tile[0];
					}
			}
			break;
			
			case 1:
			case 2:
			// Wait until next action
			{
				if !(--time) {
					// Fire twin missiles
					if routine_2 == 2 {
						routine_2 = 3;
						time = 60
						
						// Set firing animation
						anim_ID = 2;
						{
							var _left=instance_create_layer(x-10,y,"Instances",obj_Missile);
							_left.xsp=-1;
							_left.ysp=-4;
							_left.type = 1;
							var _right=instance_create_layer(x+10,y,"Instances",obj_Missile);
							_right.xsp=1;
							_right.ysp=-4;
							_right.type = 1;
						}
					}
					
					// Else turn around and continue to walk
					else
					{
						routine_2	= 0;
						time		= 128;
						move_dir	*= -1;				// Reverse the direction.
						xsp			= 0.5 * move_dir;	// Set horizontal speed .5 pixel/step.
						anim_ID		= 1;
					}
				}
			}
			break;
			
			case 3:
			// Wait for a second after firing, then turn around and continue to walk
			{
				if !(--time) {
					routine_2	= 0;
					time		= 128;
					move_dir	*= -1;				// Reverse the direction.
					xsp			= 0.5 * move_dir;	// Set horizontal speed .5 pixel/step.
					anim_ID		= 1;
				}
			}
			break;
		}
	}
	break;
}