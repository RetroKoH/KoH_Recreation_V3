/// @description Platform Routine

switch(routine) {
	case 0:
	// Init
	{
		routine++;
		solid_width		= 24;
		solid_height	= 8;
		on_obj			= false;
		pushed			= false;
	} break;
	
	case 1:
	// Check for Player Collision
	{		
		gfunc_gameobj_act_solid(solid_width, solid_height, solid_height, prev_x, false, true, false)
	} break;
}