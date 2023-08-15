/// @description Routine handling

switch(routine) {
	case 0:
	{
		// Object initialization & resetting
		routine++;
		ysp			= -7;	// Choppers jump up at a speed of 7
		origin_y	= y;	// Store the starting y position
		
		// Set direction accordingly
		anim_direction = image_xscale;
		image_xscale = 1;
	}
	break;
	
	case 1:
	{
		// Choppers simply swim up and down, popping up and coming back down again.
		y+=ysp;			// Apply speed to the badnik's y-position
		ysp+=.09375;	// Reduce speed
		
		if y>=origin_y
		{
		    y=origin_y			// Set Chopper at this position.
		    ysp=-7;				// Reset speed
		    image_speed=1/8;	// Set animation speed
		}

		if y<origin_y-192 and ysp!=0
			image_speed=1/4;
		if (y>origin_y-192 and sign(ysp)=1) {
			image_index=0;
			image_speed=0;
		}
	}
	break;
}