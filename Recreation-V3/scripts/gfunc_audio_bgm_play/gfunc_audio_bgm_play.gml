/// @function gfunc_audio_bgm_play(audio_type, sound_id)
function gfunc_audio_bgm_play(audio_type, sound_id){
	if audio_type == AU_PRIMARY {
		if (cAUDIO.bgm_track) {
			audio_stop_sound(cAUDIO.bgm_track);
			audio_sound_gain(sound_id, global.volume_bgm, 0);
		}

		// Play track
		cAUDIO.audio_event = AUEVENT_IDLE;
		var _track = global.BGM_list[sound_id].ID;
		cAUDIO.bgm_track = audio_play_sound(_track, 0, false);
			
		// Set loopdata
		cAUDIO.loop_start = global.BGM_list[sound_id].loop_start;
		cAUDIO.loop_end = global.BGM_list[sound_id].loop_end;
	}
	else { // SECONDARY (1-UP)
		if (cAUDIO.s_bgm_track) {
			audio_stop_sound(cAUDIO.s_bgm_track);
			audio_sound_gain(sound_id, global.volume_bgm, 0);
		}

		// Play track
		cAUDIO.s_audio_event = AUEVENT_IDLE;
		var _track = global.BGM_list[sound_id].ID;
		cAUDIO.s_bgm_track = audio_play_sound(_track, 0, false);
	}
}