/// @description Platform Routine

switch(routine) {
	case 0:
	// Init
	{
		routine++;
		solid_width		= 24;
		solid_height	= 8;
		on_obj			= false;
		pushed			= false;
	} break;
	
	case 1:
	// Swinging
	{	
		// Update oscillate angle
		var _ang = global.angle_data[(256-global.osc[6].value)].angle;
	
		// Calculate distance
		dist_x = dsin(_ang+91.40625) * 16;	// Changed from 90.6
		dist_y = dcos(_ang+91.40625) * 16;
	
		// Calculate final position
		child.prev_x = x;
		
		x = floor(orig_x + dist_x * (length + 0.5));
		y = floor(orig_y + dist_y * (length + 0.5));
		child.x = x;
		child.y = y;
	} break;
}