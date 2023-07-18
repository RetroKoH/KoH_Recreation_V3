/// @function gfunc_audio_bgm_play(soundid)
function gfunc_audio_bgm_play(soundid){
	if (core_Audio.bgm_track)
	{
		audio_stop_sound(core_Audio.bgm_track);
		audio_sound_gain(core_Audio.bgm_track, global.volume_bgm, 0);
	}

	// Play track
	core_Audio.audio_event[0] = AUEVENT_IDLE;
	var _track = global.BGM_list[soundid].ID;
	core_Audio.bgm_track = audio_play_sound(_track, 0, false);
			
	// Set loopdata
	core_Audio.loop_points[0] = global.BGM_list[soundid].loop_start;
	core_Audio.loop_points[1] = global.BGM_list[soundid].loop_end;
}