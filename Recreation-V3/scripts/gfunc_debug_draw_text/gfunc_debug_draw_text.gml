/// @function gfunc_debug_draw_text(x, y, text)
function gfunc_debug_draw_text(x_pos, y_pos, text){
	var _def = draw_get_font(), _algn = draw_get_halign();
	draw_set_font(FONT.Debug); draw_set_halign(fa_left);
	draw_text(x_pos,y_pos,text);
	draw_set_font(_def); draw_set_halign(_algn);
}