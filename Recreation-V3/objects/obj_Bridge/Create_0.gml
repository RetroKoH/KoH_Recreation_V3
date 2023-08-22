/// @description Init Bridge (Imported from Orbinaut Framework)

event_inherited();
image_speed = 0;
gfunc_gameobj_priority_set(4);

sprite_data = [spr_Bridge_GHZ, spr_Bridge_Post_GHZ];

solid_height = 7;
solid_width = length / 2 * 16;

y_base = y;
angle			= 0;	// Recovery Angle
active_piece	= 0;	// Piece actively being stood upon
active_depress	= 0;	// Depression of active piece

// Calculate log depression value
for (var _i = 0; _i < length; _i++) 
	depressions[_i] = (_i < length / 2 ? _i : length - _i - 1) * 2 + 2;

/* Variable Definitions	
	1. length		default = 12
	2. posts		default = true
	*/

debug_name = "Bridge";