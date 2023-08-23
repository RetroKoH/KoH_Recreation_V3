function ctrl_Player_LevelBound() {
	// Keep player within the left and right boundaries
	if floor(x) < (core_Stage.bound_left + 16) {
		x		= core_Stage.bound_left + 16;
		xsp		= 0;
		inertia	= 0;
	}

	if floor(x) > (core_Stage.bound_right - 16) {
		x		= floor(core_Stage.bound_right - 16);
		xsp		= 0;
		inertia	= 0;
	}
	
	// Kill the player if below the death boundary
	var _btm;
	if core_Stage.bound_bottom < core_Stage.target_bound_bottom
		_btm = core_Stage.target_bound_bottom;
	else
		_btm = core_Stage.bound_bottom;
	
	if y > _btm
		ctrl_Player_Death();
}