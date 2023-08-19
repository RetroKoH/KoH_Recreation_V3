/// @description Routine Handling

switch(routine) {
	case 0:
	{
		routine++;
		ysp = -3;	// The speed that the object will move at. This will decrease over time.
	} break;
	
	case 1:
	{
		if ysp<0 // If the object is moving,
		{
		    y += ysp;		// Move the object upwards with ysp.
		    ysp += .09375;	// Reduce the speed by $0018/256.
		}
		else {
			routine++;
			gfunc_powerup_set(image_index-1); // "Sprite" is a subsprite of the monitor sprite.
			time = 20;
		}
	} break;
	
	case 2:
	{
		if !--time	routine++;
	} break;
	
	case 3:
	{
		if image_alpha>0 image_alpha-=.1;
		else instance_destroy();
	} break;
}