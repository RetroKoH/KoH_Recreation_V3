/// @description Insert description here
// You can write your code in this editor

if !surface_exists(surface_tile) {
	surface_set_target(surface_tile);
	draw_clear_alpha(c_white, 0);
	draw_sprite_part_ext(spr_collision, 0, tile*TILE_SIZE, TILE_SIZE, TILE_SIZE, TILE_SIZE,
						0, 0, 4, 4, c_white, 1);
	surface_reset_target();
}

// Draw Zoomed in tile
draw_rectangle(240, 48, 240+127, 48+127, true);
draw_surface_ext(surface_tile, 240, 48, 1, 1, 0, c_white, 0.8);