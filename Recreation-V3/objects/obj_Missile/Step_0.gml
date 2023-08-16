/// @description Missile Routine

switch(routine) {
	case 0:
	// Init missile
	{
		routine++;

		if type == 0 {
				// Buzz Bomber Missile
				sprite_index	= spr_Missile_Fire;
				image_speed		= 0;
				time			= 15;
				can_harm		= false;
		}

		else {
			// Crabmeat and Newtron Missiles
			routine++;		// Skip ahead
			if type == 1
				sprite_index = spr_Missile_R;
		}	
	} break;
	
	case 1:
	// Buzz Bomber Missile Routine (Delay)
	{
		--time
		if time < 8 and image_index == 0
			image_index = 1;
		
		else if !time {
			routine++;
			sprite_index	= spr_Missile_Y;
			image_speed		= 1;
			can_harm		= true;
		}
	} break;
	
	case 2:
	// Missile Movement
	{
		// Only Crabmeat missiles are affected by gravity
		gfunc_gameobj_apply_speed(type == 1);
	} break;
}