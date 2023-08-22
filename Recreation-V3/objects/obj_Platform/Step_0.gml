/// @description Platform Routine

switch(routine) {
	case 0:
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
	{
		if gfunc_gameobj_act_solid(solid_width, solid_height, solid_height, prev_x, false, true, false)
			routine++;

		prev_x = x;
		// Rise if not being stepped on
		if y_sink > 0	y_sink -= .25;
		y = y_base + y_sink; // Nudge
		gfunc_platform_move();
		// Set to falling routine
		if falling	routine = 3;
	} break;
	
	case 2:
	{
		if !gfunc_gameobj_act_solid(solid_width, solid_height, solid_height, prev_x, false, true, false)
			routine--;
		
		prev_x = x;
		// Sink if being stepped on
		if y_sink < 4	y_sink += .25;
		y = y_base + y_sink; // Nudge
		gfunc_platform_move();
		// Set to falling routine
		if falling	routine = 3;
	} break;
	
	case 3:
	{
		gfunc_gameobj_act_solid(solid_width, solid_height, solid_height, prev_x, false, true, false);
		gfunc_gameobj_apply_speed(true);
	} break;
}