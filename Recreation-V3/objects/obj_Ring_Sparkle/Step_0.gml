/// @description Routine Handling

switch(routine) {
	case 0:
	{
		routine++
		anim_ID = 1;
	} break;
	case 1:
	{
		if anim_finished
			instance_destroy();
	} break;
}