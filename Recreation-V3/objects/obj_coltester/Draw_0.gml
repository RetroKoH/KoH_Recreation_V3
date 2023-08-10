/// @description Draw Zoomed in tile

var _x=TILE_SIZE*tile_x, _y=TILE_SIZE*tile_y
draw_rectangle(_x, _y, _x+15, _y+15, true);

draw_rectangle(240, 48, 240+127, 48+127, true);
draw_surface_ext(surface_tile, 240, 48, 1, 1, 0, c_white, 0.8);