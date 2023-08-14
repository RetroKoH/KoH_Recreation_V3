function ctrl_Player_Roll(){
	if !forced_roll and (cINPUT.k_l_h or cINPUT.k_r_h) or spindash_rev != -1
		exit;
	
	var _manual_roll = false;

	if cINPUT.k_d_h // if down is held
	{
		if abs(inertia) >= 1.03125	// If absolute gsp is past a certain threshold (SK sets to 1. I had it at 1.03125)
			_manual_roll = true;
	}
	
	if forced_roll or _manual_roll {
		spinning = true;			// Set Rolling bit
		height=HEIGHT_ROLL;			// Set tile collision radius
		width=WIDTH_ROLL;
		anim_ID=ANI_PLAYER.ROLL;
		y += height_def - height;	// Reposition character according to height change
		audio_play_sound(sfx_Roll,1,false);
	}
}