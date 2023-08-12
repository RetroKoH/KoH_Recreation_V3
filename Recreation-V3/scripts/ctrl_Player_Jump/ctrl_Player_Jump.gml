function ctrl_Player_Jump(){
	var jump_flag = false; //= (scr_player_get_ceiling_dist(0)<6); // Cant jump if a ceiling is less than 6px above you

	if cINPUT.k_abc_p
	{
		if !jump_flag						// Check ceiling collision with a line.
		{
			var jmp = jmp_spd; //- 3 * in_water;	// Alter gravity depending on whether underwater or not 
			xsp -= jmp * global.angle_data[angle].sine;
			ysp -= jmp * global.angle_data[angle].cosine;
			in_air = true;
			pushing = false;
			on_obj = false;
			jump = true;
			convex = false;
			move_lock = false;
			gfunc_audio_sfx_play(SFXs.JUMP);

			height = HEIGHT_ROLL;
			width = WIDTH_ROLL;
			anim_ID = ANI_PLAYER.ROLL;
			spinning = true;
			y += height_def - height;	// Reposition according to height change
			return true;
		}
	} return false;
}