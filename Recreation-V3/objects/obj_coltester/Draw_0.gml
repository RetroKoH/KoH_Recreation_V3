/// @description Draw Zoomed in tile

var _x=TILE_SIZE*tile_x, _y=TILE_SIZE*tile_y
draw_rectangle(_x, _y, _x+15, _y+15, true);

draw_rectangle(240, 48, 240+127, 48+127, true);
draw_surface_ext(surface_tile, 240, 48, 1, 1, 0, c_white, 0.8);

if (index > 0) {
	var _c = mode < 2 ? c_blue : c_red;
	if mode mod 2 == 0 { // Floor or Ceiling
		draw_sprite_part_ext(spr_collision, 0, (tile*TILE_SIZE)+line, 0, 1, TILE_SIZE, 240+(line*8), 48, 8, 8, _c, 0.6);
		//draw_rectangle_color(240+(line*8), 48+((16-length)*8), 247+(line*8), 48+(16*8)-1, _c, _c, _c, _c, false);
	}
	else { // Walls
		draw_sprite_part_ext(spr_collision, 0, (tile*TILE_SIZE), line, TILE_SIZE, 1, 240, 48+(line*8), 8, 8, _c, 0.6);
	}
}