/// @description Debug Info
if global.debugmode{
	var _ax=180, _ay=22;
	gfunc_debug_draw_text(_ax,_ay-18,"Audio");
	
	if (bgm_track)
	{
		var _pos = audio_sound_get_track_position(bgm_track);
		gfunc_debug_draw_text(_ax,_ay,"Track: "+string(bgm_track)+"\n"+
						 string(_pos)+" / "+string(loop_points[1])+"\n"+
						 "Loop Start: "+string(loop_points[0])+"\n");
	}
	else
		gfunc_debug_draw_text(_ax,_ay,"N/A")
}