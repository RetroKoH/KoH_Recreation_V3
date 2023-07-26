/// @function gfunc_audio_bgm_play(audio_type, sound_id)
function gfunc_audio_bgm_play(audio_type, sound_id){
	
	if !sound_id	exit;
	
	if audio_type == AU_PRIMARY {
		audio_stop_sound(cAUDIO.bgm_track);

		// Play track
		cAUDIO.audio_event = AUEVENT_IDLE;
		var _track = global.BGM_list[sound_id].ID;
		audio_sound_gain(_track, global.volume_bgm, 0);
		cAUDIO.bgm_track = audio_play_sound(_track, 0, false);
			
		// Set loopdata
		cAUDIO.loop_start = global.BGM_list[sound_id].loop_start;
		cAUDIO.loop_end = global.BGM_list[sound_id].loop_end;
	}
	else { // SECONDARY (1-UP)
		audio_stop_sound(cAUDIO.s_bgm_track);

		// Play track
		cAUDIO.s_audio_event = AUEVENT_IDLE;
		var _track = global.BGM_list[sound_id].ID;
		audio_sound_gain(_track, global.volume_bgm, 0);
		cAUDIO.s_bgm_track = audio_play_sound(_track, 0, false);
	}
}