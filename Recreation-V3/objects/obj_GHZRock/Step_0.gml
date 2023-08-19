/// @description Solid Object Routine

switch(routine) {
	case 0:
	{
		routine++;
		solid_width = 16;
		solid_height = 15;
		on_obj = false;
		pushed = false;
	} break;
	
	case 1:
	{
		gfunc_gameobj_act_solid(solid_width, solid_height, solid_height, xprevious, true, true, true);
	} break;
}