/// @function gfunc_audio_bgm_play(audio_type, sound_id)
function gfunc_audio_bgm_play(audio_type, sound_id){
	if audio_type == AU_PRIMARY {
		if (core_Audio.bgm_track) {
			audio_stop_sound(core_Audio.bgm_track);
			audio_sound_gain(sound_id, global.volume_bgm, 0);
		}

		// Play track
		core_Audio.audio_event = AUEVENT_IDLE;
		var _track = global.BGM_list[sound_id].ID;
		core_Audio.bgm_track = audio_play_sound(_track, 0, false);
			
		// Set loopdata
		core_Audio.loop_start = global.BGM_list[sound_id].loop_start;
		core_Audio.loop_end = global.BGM_list[sound_id].loop_end;
	}
	else { // SECONDARY (1-UP)
		if (core_Audio.s_bgm_track) {
			audio_stop_sound(core_Audio.s_bgm_track);
			audio_sound_gain(sound_id, global.volume_bgm, 0);
		}

		// Play track
		core_Audio.s_audio_event = AUEVENT_IDLE;
		var _track = global.BGM_list[sound_id].ID;
		core_Audio.s_bgm_track = audio_play_sound(_track, 0, false);
	}
}