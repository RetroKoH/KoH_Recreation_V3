/// @description Platform Routine

switch(routine) {
	case 0:
	// Init
	{
		routine++;
		solid_width		= 32;
		solid_height	= 8;
		on_obj			= false;
		pushed			= false;
		falling			= false;
		time			= 0;
		y_sink			= 0;
		orig_x			= x;
		orig_y			= y;
		y_base			= orig_y;
		angle			= $80;	// Not really an angle. Used for positioning
	} break;
	
	case 1:
	// Check for Player Collision, and Platform rising
	{
		// Rise if not being stepped on
		if y_sink > 0	y_sink -= .25;
		
		if gfunc_gameobj_act_solid(solid_width, solid_height, solid_height, prev_x, false, true, false)
			routine++;

		prev_x = x;
		gfunc_platform_move();
		y = y_base + y_sink; // Nudge
		// Set to falling routine
		if falling	routine = 3;
	} break;
	
	case 2:
	// Check for Player walking off the platform, and Platform sinking
	{
		// Sink if being stepped on
		if y_sink < 4	y_sink += .25;
		
		if !gfunc_gameobj_act_solid(solid_width, solid_height, solid_height, prev_x, false, true, false)
			routine--;
		
		prev_x = x;
		gfunc_platform_move();
		y = y_base + y_sink; // Nudge
		// Set to falling routine
		if falling	routine = 3;
	} break;
	
	case 3:
	// Falling
	{
		if time {
			gfunc_gameobj_act_solid(solid_width, solid_height, solid_height, prev_x, false, true, false);
			time--;
			if !time {
				if on_obj {
					on_obj = false;
					cPLAYER.in_air = true;
					
					// Need this check, likely because I mishandled object's on_obj handling elsewhere
					if cPLAYER.on_obj {
						cPLAYER.on_obj = false;
						cPLAYER.platform_id = noone;
						cPLAYER.ysp = ysp;
					}
				}
				gfunc_platform_move();
			}
		}
		// Apply gravity
		y_base += ysp;
		ysp	+= .21875;
		y = y_base;
		
		// Destroy the object when it falls below the bottom boundary
		if y > (core_Stage.bound_bottom + 128)
			instance_destroy();
	} break;
}