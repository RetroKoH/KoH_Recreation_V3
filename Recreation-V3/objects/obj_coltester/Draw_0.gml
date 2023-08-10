/// @description Draw Zoomed in tile

var _x=TILE_SIZE*tile_x, _y=TILE_SIZE*tile_y
draw_rectangle(_x, _y, _x+15, _y+15, true);

draw_rectangle(240, 48, 240+127, 48+127, true);
draw_surface_ext(surface_tile, 240, 48, 1, 1, 0, c_white, 0.8);

if (index > 0) {
	var _c = mode < 2 ? c_blue : c_red;
	var _cur_x = mouse_x mod 16, _cur_y = mouse_y mod 16;
	
	if mode mod 2 == 0 { // Floor or Ceiling
		draw_sprite_part_ext(spr_collision, 0, (tile*TILE_SIZE)+line, 0, 1, TILE_SIZE, 240+(line*8), 48, 8, 8, _c, 0.75);
		draw_sprite_ext(spr_col_line, 0, 240+_cur_x*8, 48+_cur_y*8, 8, 8, 0, c_black, 0.6);
		if (dist < 0) draw_sprite_ext(spr_col_line, 0, 240+_cur_x*8, 48+(_cur_y+dist)*8, 8, 8, 0, c_orange, alpha);
	}
	else { // Walls
		draw_sprite_part_ext(spr_collision, 0, (tile*TILE_SIZE), line, TILE_SIZE, 1, 240, 48+(line*8), 8, 8, _c, 0.75);
		draw_sprite_ext(spr_col_line, 0, 240+_cur_x*8, 48+_cur_y*8, 8, 8, 0, c_black, 0.6);
		if (dist < 0) draw_sprite_ext(spr_col_line, 0, 240+(_cur_x+dist)*8, 48+_cur_y*8, 8, 8, 0, c_orange, alpha);
	}
}