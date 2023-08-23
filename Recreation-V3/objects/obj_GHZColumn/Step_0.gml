/// @description Solid Object Routine

switch(routine) {
	case 0:
	{
		routine++;
		solid_width = 32;
		solid_height = 69;
		on_obj = false;
		pushed = false;
	} break;
	
	case 1:
	{
		gfunc_gameobj_act_solid(solid_width, solid_height, solid_height, xprevious, true, true, false);
		
		y = orig_y + ((angle - $40) >> 1);
		
		angle = global.osc[6].value;
	} break;
}