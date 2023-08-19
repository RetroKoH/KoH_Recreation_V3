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
		xsp				= 0;
		ysp				= 0;
		solid_width		= 15;
		solid_height	= 15;
		time			= 0;
		icon			= type + 1; // Offset to skip the random icon
		falling			= false;
	} break;
	
	case 1:
	// Unbroken (Solid Routine)
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
		else
			gfunc_gameobj_act_solid(solid_width, solid_height, solid_height, xprevious, true, true, false);
	
		if (anim_spriteframe == 3)
			anim_spriteframe += icon;	// We don't use framemod here, so it doesn't have to modify the animation every frame.
	} break;
	
	case 2:
	// Broken (TouchResponse)
	{
		routine++;
		var _pow = instance_create_layer(x, y, "Instances", obj_Monitor_Icon);
		_pow.image_index = icon;
	}
	
	case 3:
	// Post-Explosion
	{
		if (++time) == 12
			instance_change(obj_Monitor_Destroyed, true);
	} break;
}