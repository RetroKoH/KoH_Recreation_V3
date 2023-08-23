/// @description Routine

switch(routine) {
	case 0:
	{
		routine++
		solid_width = 8;
		solid_height = 32;
	} break;
	case 1:
	{
		if solid_wall
			gfunc_gameobj_act_solid(solid_width, solid_height, solid_height, x, true, false, false);
	} break;
}