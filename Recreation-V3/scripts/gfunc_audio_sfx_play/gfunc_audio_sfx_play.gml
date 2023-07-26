/// @function gfunc_audio_sfx_play(sound_id)
function gfunc_audio_sfx_play(_sound_id, _looping){
	// Stop sound if already playing (to avoid overlap)
	if audio_is_playing(_sound_id)
		audio_stop_sound(_sound_id);

	// Play sound
	audio_play_sound(_sound_id, 0, _looping);	
	
	// Set volume
	audio_sound_gain(_sound_id, global.volume_sfx, 0);
}