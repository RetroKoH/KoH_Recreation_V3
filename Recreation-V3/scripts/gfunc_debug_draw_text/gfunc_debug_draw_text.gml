/// @function gfunc_debug_draw_text(x, y, text)
function gfunc_debug_draw_text(x_pos, y_pos, text){
	var _def = draw_get_font();
	draw_set_font(FONT.Debug);
	draw_text(x_pos,y_pos,text);
	draw_set_font(_def);
}