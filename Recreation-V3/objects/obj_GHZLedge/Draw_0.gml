/// @description Insert description here

event_inherited();

if global.debugmode
	if solid_heightmap != false
		for (var _i = 0; _i < array_length(solid_heightmap); _i++)
			draw_sprite_ext(spr_debug_line, 0, x-solid_width + _i, y-solid_heightmap[_i], 1,1,0,c_red,1);