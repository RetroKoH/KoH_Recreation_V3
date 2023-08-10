/// @description Tile detection via the mouse

// Tile detection
var _tile = tilemap_get(global.map_id[0], mouse_x div TILE_SIZE, mouse_y div TILE_SIZE);
index = tile_get_index(_tile);
length = gfunc_tile_get_height(mouse_x, mouse_y, _tile, index);
