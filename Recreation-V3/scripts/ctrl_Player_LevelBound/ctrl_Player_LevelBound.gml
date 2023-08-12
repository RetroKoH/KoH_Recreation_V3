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
	//if y>v_limitbtm2        scr_player_death();
}