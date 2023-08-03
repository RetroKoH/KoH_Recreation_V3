/// @description Routine Handling

if !core_Stage.can_pause
	exit;

switch(routine) {
	case 0:
	{
		routine++;
		height	= height_def;
		width	= WIDTH_MAIN;
	}
	break;
	
	case 1:
	{
		script_execute(control_modes);
	}
	break;
	
	case 2: // Sonic_Hurt
	case 3: // Sonic_Death
	case 4: // Sonic_Restart
	break;
}