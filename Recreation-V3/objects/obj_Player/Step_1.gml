/// @description Routine Handling

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
	}
	break;
	
	case 2: // Sonic_Hurt
	{
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