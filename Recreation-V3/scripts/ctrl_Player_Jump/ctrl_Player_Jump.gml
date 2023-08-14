function ctrl_Player_Jump(){

	// Prevent jumping if a ceiling is less than 6px above you
	if min(gfunc_collide_dist_ceiling(-width, -height, COL_FLOOR)[0],
			gfunc_collide_dist_ceiling(width, -height, COL_FLOOR)[0]) < 6
		return false;

	if cINPUT.k_abc_p
	{
		var jmp		= !in_water ? jmp_spd : (jmp_spd - 3);

		xsp			-= jmp * angle_data.sine;
		ysp			-= jmp * angle_data.cosine;
		in_air		= true;
		pushing		= false;
		on_obj		= false;
		jump		= true;
		convex		= false;
		move_lock	= false;
		gfunc_audio_sfx_play(SFXs.JUMP);

		height		= HEIGHT_ROLL;
		width		= WIDTH_ROLL;
		anim_ID		= ANI_PLAYER.ROLL;
		spinning	= true;
		y			+= height_def - height;	// Reposition according to height change
		return true;
	}
	return false;
}