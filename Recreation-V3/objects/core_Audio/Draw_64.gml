/// @description Debug Info
if global.debugmode{
	var _ax=180, _ay=22;
	gfunc_debug_draw_text(_ax,_ay-18,"Audio"+"\n"+
	"Event: "+string(audio_event)+"\n"+
	"Track: "+string(bgm_track)+"\n"+
	string(track_pos)+" / "+string(loop_end)+"\n"+
	"Loop Start: "+string(loop_start)+"\n"+
	
	"S-Event: "+string(s_audio_event)+"\n"+
	"S-Track: "+string(s_bgm_track)+"\n"+string(s_track_pos));
}