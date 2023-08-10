/// @description Surface Check

if !surface_exists(surface_tile) {
	surface_tile = surface_create(128, 128);
	surface_set_target(surface_tile);
	draw_clear_alpha(c_white, 0);
	draw_sprite_part_ext(spr_collision, 0, tile*TILE_SIZE, TILE_SIZE, TILE_SIZE, TILE_SIZE,
						0, 0, 8, 8, c_white, 1);
	surface_reset_target();
}