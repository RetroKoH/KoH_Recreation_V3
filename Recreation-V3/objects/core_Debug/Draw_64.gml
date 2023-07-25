/// @description Debug Info

if !global.debugmode
	exit;

// INPUT
var _ax=2, _ay=22;
gfunc_debug_draw_text(_ax,_ay-18,"Input");
// 8 pixels length; 2 pixels apart.
draw_rectangle(_ax+10,	_ay,	_ax+18,	_ay+8,	cINPUT.k_u_h=false);
draw_rectangle(_ax,		_ay+10,	_ax+8,	_ay+18, cINPUT.k_l_h=false);
draw_rectangle(_ax+20,	_ay+10,	_ax+28,	_ay+18,	cINPUT.k_r_h=false);
draw_rectangle(_ax+10,	_ay+20,	_ax+18,	_ay+28,	cINPUT.k_d_h=false);

draw_circle(_ax+38,	_ay+20,	5,	cINPUT.k_a_h=false);
draw_circle(_ax+50,	_ay+18,	5,	cINPUT.k_b_h=false);
draw_circle(_ax+62,	_ay+16,	5,	cINPUT.k_c_h=false);

draw_roundrect(_ax+44, _ay, _ax+56, _ay+4, cINPUT.k_st_h=false);

if instance_exists(cPLAYER)
	gfunc_debug_draw_text(_ax,_ay+120,cPLAYER.x);

// PALETTE
_ax=78;
gfunc_debug_draw_text(_ax,_ay-18,"Palette");
draw_sprite_general(spr_PalViewer,0,0,0,16,64,_ax,_ay,6,6,0,c_white,c_white,c_white,c_white,1);
draw_rectangle(_ax,_ay,_ax+(16*6)-1,_ay+(4*6)-1,true);

// AUDIO
_ax=180;
gfunc_debug_draw_text(_ax,_ay-18,"Audio"+"\n"+
"Event: "+string(cAUDIO.audio_event)+"\n"+
"Track: "+string(cAUDIO.bgm_track)+"\n"+
string(cAUDIO.track_pos)+" / "+string(cAUDIO.loop_end)+"\n"+
"Loop Start: "+string(cAUDIO.loop_start)+"\n"+
	
"S-Event: "+string(cAUDIO.s_audio_event)+"\n"+
"S-Track: "+string(cAUDIO.s_bgm_track)+"\n"+string(cAUDIO.s_track_pos));

// SURFACE RENDERING
_ax=302;
var _xf = _ax+(424*0.2);

gfunc_debug_draw_text(_ax,_ay-18,"Rendering");

draw_rectangle(_ax, _ay-9, _xf+1, _ay-9+(240*0.2)+1, false)
draw_surface_ext(cRENDER.surface_main, _ax+1, _ay-8, 0.2, 0.2, 0, c_red, 0.6);

gfunc_debug_draw_text(_xf+7, _ay-8,	string(cRENDER.fade_step)+"\n"+
									string(cRENDER.fade_mode)+"\n"+
									string(cRENDER.fade_blend)+"\n"+
									string(cRENDER.fade_speed)+"\n"+
									string(cRENDER.surface_main)+"\n"+
									string(cRENDER.surface_overlay));