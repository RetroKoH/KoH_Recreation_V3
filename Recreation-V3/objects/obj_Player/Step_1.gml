/// @description Pre-Object handling

switch(routine) {
	case 0:
		routine++;
		
		xsp			= 0;
		ysp			= 0;
		inertia		= 0;
		angle		= 0;
		width		= WIDTH_MAIN;
		height		= HEIGHT_MAIN;
		height_def	= height;
	break;
	
	case 1:
		script_execute(control);
	break;
}

// Set mask w/ current sprite and direction
mask_index=anim_mask[(anim_direction==-1)];