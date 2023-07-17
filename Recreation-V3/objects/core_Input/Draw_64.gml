/// @description Debug Info
if global.debugmode{
	var _ax=4, _ay=14;
	draw_text(_ax,_ay-20,"Input");
	draw_rectangle(_ax+15,	_ay+8,	_ax+25,	_ay+18,	k_u_h=false);
	draw_rectangle(_ax,		_ay+20,	_ax+10,	_ay+30, k_l_h=false);
	draw_rectangle(_ax+30,	_ay+20,	_ax+40,	_ay+30,	k_r_h=false);
	draw_rectangle(_ax+15,	_ay+32,	_ax+25,	_ay+42,	k_d_h=false);

	draw_circle(_ax+54,	_ay+24,	6,	k_a_h=false);
	draw_circle(_ax+68,	_ay+22,	6,	k_b_h=false);
	draw_circle(_ax+82,	_ay+20,	6,	k_c_h=false);

	draw_roundrect(_ax+64, _ay-2, _ax+82, _ay+6, k_st_h=false);
}