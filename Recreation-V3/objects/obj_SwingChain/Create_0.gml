/// @description Init Platform

event_inherited();
image_speed = 0;
gfunc_gameobj_priority_set(4);

orig_x		= x;
orig_y		= y;
dist_x		= 0;
dist_y		= 0;
amplitude	= (length + 2) * 16 + sprite_get_width(sprite_index) div 2;

child = instance_create_layer(x, y, "Instances", obj_SwingPlatform);

/* Variable Definitions	
	1. length,		default = 4
	2. swing_speed,	default = 1
	*/

debug_name = "Swinging Platform";