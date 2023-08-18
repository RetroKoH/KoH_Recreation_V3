/// @description Routine handling

switch(routine) {
	case 0:
	// Object initialization & resetting
	{
		routine++;
		routine_2	= 0;
		xsp			= 0;
		ysp			= 0;
		height		= 16;
		width		= 8;
		path		= 0;
		can_hit		= false;
		can_harm	= false;
		has_fired	= false;
		
		// Set direction accordingly
		anim_direction = image_xscale;
		image_xscale = 1;
	} break;
	
	case 1:
	// Set position on the ground
	{
		switch(routine_2) {
			case 0:
			// Check Distance to Player
			{
				// Direct view towards player
				if (cPLAYER.x > x)	anim_direction = -1;
				else				anim_direction = 1;
				
				var _dist = abs(cPLAYER.x - x);
				
				if (_dist < 128) {
					if !(type) {
						// Blue Newtron (Rocket)
						routine_2 = 1;
						anim_ID = 1;
					}
					
					else {
						// Green Newtron (Fire Missile)
						routine_2 = 4;
						anim_ID = 3;
					}
				}
			} break;
			case 1:
			// Blue Newtron subroutine (Appearing and Falling to the Ground)
			{
				// Activate
				if (anim_frame == 1) {
					can_hit = true;
					can_harm = true;
				}

				// is Newt still "appearing"?
				else if (anim_frame < 4) {
					if (cPLAYER.x > x)	anim_direction = -1;
					else				anim_direction = 1;
				}

				// if animation is finished, let's drop down
				else {
					gfunc_gameobj_apply_speed(true);
					var _dist = gfunc_collide_dist_floor(0, height, COL_FLOOR)[0];
					
					if (_dist < 0) {
						routine_2++;
				        y		+= _dist;            
				        ysp		= 0;
						anim_ID	= 2;
						xsp		= 2*-anim_direction;
				    }
				}
			} break;
			case 2:
			// Blue Newtron subroutine (Following the Terrain)
			{
				gfunc_gameobj_apply_speed(false);

				var _dist = gfunc_collide_dist_floor(0, height, COL_FLOOR)[0];
				if !(_dist < -8 or _dist >= $C)
					y+=_dist;
					
				else routine_2++;
			} break;
			case 3:
			// Blue Newtron subroutine (Moving through the air)
			{
				gfunc_gameobj_apply_speed(false);
			} break;
			case 4:
			// Green Newtron subroutine
			{
				if (anim_frame == 1) {
					can_hit = true;
					can_harm = true;
				}
				else if (anim_frame == 2) {
					if !(has_fired) {
						has_fired	= true;
						var _shot	= instance_create_layer(x+($14*-anim_direction),y-8,"Instances",obj_Missile);
						_shot.type	= 2;
						_shot.xsp	= 2*-anim_direction;
						_shot.ysp	= 0;
					}
				}
			} break;
		}
	} break;
}