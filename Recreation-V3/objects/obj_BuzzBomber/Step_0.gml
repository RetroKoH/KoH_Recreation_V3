/// @description Routine handling

switch(routine) {
	case 0:
	// Object initialization & resetting
	{
		routine++;
		time		= 0;
		status		= 0;
		wing_frame	= 0;
		flame_frame = 0;
		
		// Set direction accordingly
		anim_direction = image_xscale;
		image_xscale = 1;
	}
	break;
	
	case 1:
	// Firing or Starting Movement
	{
		if !--time {
			if status == 2 {
				//var shot = instance_create_layer(x+($14*-anim_direction),y+$1C,"Instances",obj_missile);
				//shot.xsp = 2*-anim_direction;
				//shot.ysp = 2;
				//time = 15; // Apply time delay to the missile
				status = 1;
				time = 60;
				anim_ID = 2;
			}
		
			else {
				routine++;
				time = 128;
				xsp = 4 * -anim_direction;
				anim_ID = 1;
			}
		}
		
		// Alternate wings each frame
		wing_frame^=1;
	}
	break;
	
	case 2:
	// Movment and Checking near player
	{
		if !--time {
			routine--;
			status = 0;
			anim_direction *= -1;
			time = 60;
			xsp = 0;
			anim_ID = 0;
		}
		else {
			gfunc_gameobj_apply_speed(false);
			flame_frame = (flame_frame + 0.5) mod 2;
			if !status {
				if abs(x - cPLAYER.x) <= 64 {
					status = 2;
					time = 30;
					routine--;
					xsp = 0;
					anim_ID = 0;
				}
			}
		}
		
		// Alternate wings each frame
		wing_frame^=1;
	}
	break;
}