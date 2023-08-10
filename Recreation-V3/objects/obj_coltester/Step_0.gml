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
	}

	// Walls
	else {
		line = mouse_y mod 16;
		if tile_get_flip(_tile)
				line = 16 - 1 - line;
	
		length = global.tile_widths[index&$FF][line];
	}
}

else {
	line = -1;
	length = -1;
}