/// @description Routines

switch(routine) {
	case 0:
	{
		routine++;
		solid_width		= 8;
		solid_height	= 6;
		
		// Build Log Helix (This won't be repeated)
		var _x = x;

		_x -= (length div 2)*16;	// x_pos of left-most spiked log
		var _frame = 0;					// Frame for piece
	
		repeat(length)
		{
			if _x != x	// if _x is not at the controller's position, create another log.
			{
				var _obj = instance_create_layer(_x, y, "Instances", obj_SpikeLogHelix);
				_obj.routine		= 1;			// Skip Creation Routine
				_obj.length			= 0;			// Display logs don't have length
				_obj.helix_frame	= _frame;		// Set helix frame for the child object
				_obj.solid_width	= solid_width;
				_obj.solid_height	= solid_height;
				_frame++;
				_frame &= 7;
			}
			else
			{
				helix_frame = _frame;
				_frame++;
				_frame &= 7;
			}
			_x += $10;
		}
	} break;
	
	case 1:
	{
		gfunc_gameobj_act_solid(solid_width, solid_height, solid_height, x, false, true, false);
		
		can_harm = false;
		image_index = (global.sync_anim[0].frame + helix_frame)&7;
		if !(image_index) can_harm = true;
	}
	break;
}