/// @description Routine Handling

switch(routine) {
	case 0:
	// Init
	{
		routine++;
		// Change Elemental shields to Blue Shields if necessary
		if	(type == MONITOR.SHIELD_F or
			 type == MONITOR.SHIELD_B or
			 type == MONITOR.SHIELD_L and global.str_opt_shld == 0)
			 type = MONITOR.SHIELD;

		// Init other variables
		xsp		= 0;
		ysp		= 0;
		time	= 0;
		icon	= type;
		falling	= false;
	} break;
	
	case 1:
	// Unbroken
	{
		// Check if itembox is airborne
		if falling {
			gfunc_gameobj_apply_speed(true);
			y += ysp;	// Move
			
			// Collide with floor
			var _dist = gfunc_collide_dist_floor(0, solid_height, COL_FLOOR)[0];
			if  _dist < 0
			{
				y		+= _dist;
				falling	= false;
			}
		}
	} break;
	
	case 2:
	// Broken
	{
		if (++time) == 12
			instance_change(obj_Monitor_Destroyed, true);
	} break;
}