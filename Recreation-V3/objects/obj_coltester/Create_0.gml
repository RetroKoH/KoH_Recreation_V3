/// @description Insert description here
// You can write your code in this editor

tile = 0;			// Tile drawn on screen
index = 0;			// Index of detected tile (0 if not detected by mouse)
line = 0;			// Line in which tile is being interacted with
length = 0;			// Length at current tile
angle = global.tile_angles[tile];

dir = 1;
mode = COL_FLOOR;

tile_x = 9;
tile_y = 6;

mirrored = false;
flipped = false;

tilemap_set(global.map_id[0], tile, tile_x, tile_y);

surface_tile = surface_create(128, 128);
surface_set_target(surface_tile);
draw_sprite_part_ext(spr_collision, 0, tile*TILE_SIZE, TILE_SIZE, TILE_SIZE, TILE_SIZE,
					0, 0, 8, 8, c_white, 1);
surface_reset_target();