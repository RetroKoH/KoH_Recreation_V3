/// @description Bridge Routine (Imported from Orbinaut Framework)
switch(routine) {
	case 0:
	{
		routine++;
		x += (length / 2 - 6) * 16;
		angle			= 0;
		active_piece	= 0;
		active_depress	= 0;
	} break;
	
	case 1:
	{
		// Get player position within the bridge
		var _pos = (floor(cPLAYER.x) - (x - length / 2 * 16 - 16)) div 16;
		
		if (cPLAYER.on_obj and cPLAYER.platform_id == id) {
			if angle < $40
				angle += 4;
		}
		else {
			if angle > $00
				angle -= 4;
		}
		
		// Get current maximum depression
		active_piece	= clamp(_pos, 1, length);
		active_depress	= depressions[active_piece - 1];
		
		// Update bridge position
		y = y_base + floor(active_depress * global.angle_data[angle].sine);
		
		gfunc_gameobj_act_solid(solid_width, solid_height, solid_height, xprevious, false, true, false);
	} break;
}