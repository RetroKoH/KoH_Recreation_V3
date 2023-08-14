/// @description Dash Dust Routine

switch(routine) {
	case 0:
	{
		routine++
		// Match player's facing direction
		image_xscale = parent.flipped ? -1 : 1;
	}
	break;
	
	case 1:
	{
		// Follow player
		x = floor(parent.x);
		y = floor(parent.y + parent.height);	
	
		// Destroy if player is airborne or not spindashing anymore
		if parent.in_air or parent.spindash_rev == -1
			instance_destroy();
	}
	break;
}