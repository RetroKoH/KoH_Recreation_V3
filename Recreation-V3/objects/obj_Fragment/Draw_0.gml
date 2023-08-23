/// @description Draw sprite and sprite outline

draw_sprite_part(sprite_index, image_index, frag_wid*index_x, frag_hgt*index_y, frag_wid, frag_hgt, x, y);

if global.debugmode {
	// Special Debug drawing
	draw_rectangle_color(floor(x), floor(y), floor(x)+frag_wid-1, floor(y)+frag_hgt-1,
		                c_white,c_white,c_white,c_white,true);
	// Draw origin
	draw_sprite(spr_debug_center,0,floor(x),floor(y));
}