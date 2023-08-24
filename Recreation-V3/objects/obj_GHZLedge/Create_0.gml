/// @description Init Ledges

event_inherited();
image_speed = 0;
gfunc_gameobj_priority_set(4);

time			= 0;
orig_x			= x-48;
orig_y			= y-56;
collapsing		= false;
solid_heightmap	= global.heightmap_GHZLedge[image_index];

// Used for Fragment generation
width			= ceil(sprite_width / 16) * 16;
height			= ceil(sprite_height / 16) * 16;

debug_name = "Platform";