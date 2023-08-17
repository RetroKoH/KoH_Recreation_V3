/// @description Animal Routine

switch(routine) {
	case 0:
	// Init animal based, in part, on its type
	{
		routine++;
		width = 4;
		height = 12;
		xsp = 0;
		ysp = -4;
		frame_time = 1;

		sprite_index	= global.animal_sprite[type];
		mov_xsp			= global.animal_xsp[type];
		mov_ysp			= global.animal_ysp[type];
	} break;
	
	case 1:
	// Fall after spawning
	{
		gfunc_gameobj_apply_speed(true);
		var _dist = gfunc_collide_dist_floor(0, height, COL_FLOOR)[0];
		if _dist <= 0
		{
			routine			+= type+1;
			y				+= _dist;
			xsp				= mov_xsp;
			ysp				= mov_ysp;
			image_index		= 1;
			image_xscale	= -1; // Enemy animals always face left
		}
	} break;
	
	case 2: // Flicky (Subtype 0; Sub #5 in Sonic 1 engine)
	case 7: // Clucky (Subtype 5; Sub #1 in Sonic 1 engine)
	{
		gfunc_gameobj_apply_speed(false);
		ysp += .09375;
		
		var _dist = gfunc_collide_dist_floor(0, height, COL_FLOOR)[0];
		if _dist <= 0
		{
			y	+= _dist;
			ysp	= mov_ysp;
		}

		if --frame_time < 0
		{
			frame_time = 1;
			if image_index == 1 image_index++;
			else image_index--;
		}
	} break;
	
	case 3: // Ricky (Subtype 1; Sub #6 in Sonic 1 engine)
	case 4: // Pocky (Subtype 2; Sub #0 in Sonic 1 engine)
	case 5: // Pecky (Subtype 3; Sub #2 in Sonic 1 engine)
	case 6: // Picky (Subtype 4; Sub #4 in Sonic 1 engine)
	case 8: // Rocky (Subtype 6; Sub #3 in Sonic 1 engine)
	{
		gfunc_gameobj_apply_speed(true);
		if ysp > 0	image_index = 2;
		
		var _dist = gfunc_collide_dist_floor(0, height, COL_FLOOR)[0];
		if _dist <= 0
		{
			y			+= _dist;
			ysp			= mov_ysp;
			image_index	= 1;
		}
	} break;
}