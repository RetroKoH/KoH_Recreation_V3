/// @description Debug Info
if global.debugmode{
	var _ax=78, _ay=22;
	gfunc_debug_draw_text(_ax,_ay-18,"Palette");
	draw_sprite_general(spr_PalViewer,0,0,0,16,64,_ax,_ay,6,6,0,c_white,c_white,c_white,c_white,1);
	draw_rectangle(_ax,_ay,_ax+(16*6)-1,_ay+(4*6)-1,true);
}