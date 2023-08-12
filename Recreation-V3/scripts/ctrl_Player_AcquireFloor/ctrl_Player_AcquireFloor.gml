function ctrl_Player_AcquireFloor() {
	var _h = height;		// Store current height
	height=height_def;		// Reset collision box
	width=WIDTH_MAIN;

	if (spinning)			// If Sonic is spinning
	{
		spinning	= false;			// Clear spin status
		anim_ID		= ANI_PLAYER.WALK;
		y			-= height_def - _h;	// Pop y-pos out using stored height
	}

	pushing	= false;		// Clear push status
	in_air	= false;		// Clear air status
	// Clear roll jump status
	jump	= false;
	// Clear chain bonus counter
	
	// Double jump related stuff below
}