/// @description Points Routine

switch(routine) {
	case 0:
	{
		routine++;
		image_index	= pts;
		ysp			= -3;
	} break;
	
	case 1:
	{
		if ysp < 0	// If the object is moving,
		{
			y	+= ysp;		// Move the object upwards with ysp.
			ysp	+= .09375;	// Reduce the speed by $18/256.
		}
		else		// If not, fade out
		{
			if image_alpha>0
				image_alpha-=.1;
			else
				instance_destroy();
		}
	} break;
}