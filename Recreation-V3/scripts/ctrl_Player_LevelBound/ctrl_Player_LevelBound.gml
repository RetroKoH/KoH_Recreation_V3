function ctrl_Player_LevelBound(){
	// Keep player within the left and right boundaries
	if floor(x) < 16 {
		x		= 16;
		xsp		= 0;
		inertia	= 0;
	}

	if floor(x) > (room_width - 16) {
		x		= room_width - 16;
		xsp		= 0;
		inertia	= 0;
	}
	
	// Kill the player if below the death boundary
	//if y>v_limitbtm2        scr_player_death();
}