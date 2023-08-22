/// @description Routine Handling

mask_index=anim_mask[(anim_direction==-1)];

if !core_Stage.can_pause
	exit;

switch(routine) {
	case 0: // Sonic_Init
	{
		routine++;
		height		= height_def;
		width		= WIDTH_MAIN;
		width_push	= width + 1;
	}
	break;
	
	case 1: // Sonic_Main
	{
		script_execute(control_modes);
		ctrl_Player_TouchResponse();
	}
	break;
	
	case 2: // Sonic_Hurt
	{
		gfunc_gameobj_apply_speed(false);
		ysp += (in_water) ? .0625 : .1875;	// Apply gravity (Slightly different in this state)
		ctrl_Player_Hurt_Stop();			// Revert player to Main Routine upon landing
		ctrl_Player_LevelBound();			// Keep player inside the view and kill Sonic if he touches the kill plane
	}
	break;

	case 3: // Sonic_Death
	{
		if (y > camera_get_view_y(GAMECAM) + $120)
		{
			routine++;
			global.p_lives--;
			ysp	= 0;
		}
		gfunc_gameobj_apply_speed(true);
	}
	break;

	case 4: // Sonic_Restart
	{
		// Sonic does nothing, while the stage object handles
		// restarting the level
	}
	break;
}