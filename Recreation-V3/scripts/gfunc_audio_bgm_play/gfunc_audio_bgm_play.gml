/// @function gfunc_audio_bgm_play(audio_type, sound_id)
function gfunc_audio_bgm_play(sound_id){
	
	if sound_id < 0		exit;
	
	if global.BGM_list[sound_id].audio_type == AU_PRIMARY {
		audio_stop_sound(cAUDIO.bgm_track);

		// Play track
		cAUDIO.audio_event = AUEVENT_IDLE;
		var _track = global.BGM_list[sound_id].ID;
		cAUDIO.bgm_track = audio_play_sound(_track, 0, false);
		audio_sound_gain(cAUDIO.bgm_track, global.volume_bgm, 0);
			
		// Set loopdata
		cAUDIO.loop_start = global.BGM_list[sound_id].loop_start;
		cAUDIO.loop_end = global.BGM_list[sound_id].loop_end;
	}
	else { // SECONDARY (1-UP)
		audio_stop_sound(cAUDIO.s_bgm_track);

		// Play track
		cAUDIO.s_audio_event = AUEVENT_IDLE;
		var _track = global.BGM_list[sound_id].ID;
		cAUDIO.s_bgm_track = audio_play_sound(_track, 0, false);
		audio_sound_gain(cAUDIO.s_bgm_track, global.volume_bgm, 0);
	}
}