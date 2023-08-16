/// @description Routine handling

switch(routine) {
	case 0:
	// Object initialization & resetting
	{
		routine++;
		routine_2	= 0;
		height		= $E;
		width		= 8;
		angle		= 0;
		path		= 0;
		time		= 0;
		smoke_delay	= 0;
		
		// Set direction accordingly
		anim_direction = image_xscale;
		image_xscale = 1;
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
	// General Movement - Uses Secondary Routine
	{
		switch(routine_2)
		{
			case 0:
			// Waiting, and getting ready to move the motobug when ready
			{
				if !--time					// If timer reaches zero...
				{
					routine_2++;						// We will run the second routine afterwards.
					anim_direction	*= -1;				// Reverse the direction.
					xsp				= -anim_direction;	// Set horizontal speed 1 pixel/step.
					anim_ID			= 1;
				}
			}
			break;
			
			case 1:
			// Moving the motobug, creating smoke, and checking for when it needs to stop.
			{
				gfunc_gameobj_apply_speed(false);
				
				// Check for floor. If it doesn't exist, stop and wait, then turn around. For now, set to a timer.
				var _dist = gfunc_collide_dist_floor(width*sign(xsp), height, COL_FLOOR)[0]
				if _dist >= 12 or _dist < -8 {
				    routine_2--;
				    time	= 60;
				    xsp		= 0;
					anim_ID	= 0;
				}
				else {
					// Smoke puff routine. Only occurs when the badnik is moving.
					if !--smoke_delay
					{
					    instance_create_layer(x+(15*anim_direction),y-1,"Instances",obj_MotobugSmoke); // Create smoke puff
					    smoke_delay=16;		// Reset timer
					}
					
					// Adhere to the surface
					y += _dist;
				}
			}
			break;
		}
	}
	break;
}