/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(vk_left) {
	tile--;
	if tile < 0
		tile = 256;
		
	tilemap_set(global.map_id[0], tile, tile_x, tile_y);

	surface_set_target(surface_tile);
	draw_clear_alpha(c_white, 0);
	draw_sprite_part_ext(spr_collision, 0, tile*TILE_SIZE, TILE_SIZE, TILE_SIZE, TILE_SIZE,
						0, 0, 8, 8, c_white, 1);
	surface_reset_target();
}

if keyboard_check_pressed(vk_right) {
	tile++;
	if tile > 255
		tile = 0;
		
	tilemap_set(global.map_id[0], tile, tile_x, tile_y);

	surface_set_target(surface_tile);
	draw_clear_alpha(c_white, 0);
	draw_sprite_part_ext(spr_collision, 0, tile*TILE_SIZE, TILE_SIZE, TILE_SIZE, TILE_SIZE,
						0, 0, 8, 8, c_white, 1);
	surface_reset_target();
}

if keyboard_check_pressed(vk_up) {
	mode--;
	if mode < 0
		mode = 3;
}

if keyboard_check_pressed(vk_down) {
	mode++;
	if mode > 3
		mode = 0;
}