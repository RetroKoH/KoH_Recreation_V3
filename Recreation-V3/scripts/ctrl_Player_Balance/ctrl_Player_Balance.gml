function ctrl_Player_Balance() {
	if inertia != 0
		exit;
	
	if !on_obj {
		if cINPUT.k_d_h or angle_data.quad_floor
			exit;
		
		var _floor	= gfunc_collide_dist_floor(0, height, COL_FLOOR)[0];
		if _floor < 12
			exit;
		
		// Get floor angles and continue if only one exists
		var _dist1 = gfunc_collide_dist_floor(-width, height, COL_FLOOR)[0];
		var _dist2 = gfunc_collide_dist_floor(width, height, COL_FLOOR)[0];
		
		if !(_dist1>0 and !_dist2>0 or !_dist1>0 and _dist2>0)
			exit;
		
		// Balance!
		if _dist1 > 0
			ctrl_Player_BalanceLeft();

		else if _dist2 > 0
			ctrl_Player_BalanceRight();

	}
}

function ctrl_Player_BalanceLeft() {
	if flipped
		anim_ID = ANI_PLAYER.BALANCE;

	else
		anim_ID = ANI_PLAYER.BALANCE_2;
}

function ctrl_Player_BalanceRight() {	
	if !flipped
		anim_ID = ANI_PLAYER.BALANCE;

	else
		anim_ID = ANI_PLAYER.BALANCE_2;
}