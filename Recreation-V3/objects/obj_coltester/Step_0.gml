/// @description Tile detection via the mouse

// Tile detection
var _tile = tilemap_get(global.map_id[0], mouse_x div TILE_SIZE, mouse_y div TILE_SIZE);
index = tile_get_index(_tile);

if (index > 0) {
	// Floor/Ceiling
	if mode mod 2 == 0 {
		line = mouse_x mod 16;
		if tile_get_mirror(_tile)
				line = 16 - 1 - line;

		length = global.tile_heights[index&$FF][line];
		
		if dir == 1
			dist = (mouse_y & -16) + (16 - length - 1) - mouse_y;
		else
			dist = mouse_y - ((mouse_y & -16) + (16 + length)) + 16;
	}

	// Walls
	else {
		line = mouse_y mod 16;
		if tile_get_flip(_tile)
				line = 16 - 1 - line;
	
		length = global.tile_widths[index&$FF][line];
		
		if dir == 1
			dist = (mouse_x & -16) + (16 - length - 1) - mouse_x;
		else
			dist = mouse_x - ((mouse_x & -16) + (16 + length)) + 16;
	}
}

else {
	line = -1;
	length = -1;
}