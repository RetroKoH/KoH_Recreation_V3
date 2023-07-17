/// @description Debug Info
if global.debugmode{
	var _ax=2, _ay=22;
	gfunc_debug_draw_text(_ax,_ay-18,"Input");
	// 8 pixels length; 2 pixels apart.
	draw_rectangle(_ax+10,	_ay,	_ax+18,	_ay+8,	k_u_h=false);
	draw_rectangle(_ax,		_ay+10,	_ax+8,	_ay+18, k_l_h=false);
	draw_rectangle(_ax+20,	_ay+10,	_ax+28,	_ay+18,	k_r_h=false);
	draw_rectangle(_ax+10,	_ay+20,	_ax+18,	_ay+28,	k_d_h=false);

	draw_circle(_ax+38,	_ay+20,	5,	k_a_h=false);
	draw_circle(_ax+50,	_ay+18,	5,	k_b_h=false);
	draw_circle(_ax+62,	_ay+16,	5,	k_c_h=false);

	draw_roundrect(_ax+44, _ay, _ax+56, _ay+4, k_st_h=false);
}