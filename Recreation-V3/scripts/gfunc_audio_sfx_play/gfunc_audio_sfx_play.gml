/// @function gfunc_audio_sfx_play(sound_id, [looping])
function gfunc_audio_sfx_play(_sound_id, _looping=false) {	
	var _sfx = global.SFX_list[_sound_id].ID;
	
	// Stop sound if already playing (to avoid overlap)
	if audio_is_playing(_sfx)
		audio_stop_sound(_sfx);

	// Play sound
	var _play = audio_play_sound(_sfx, 0, _looping);	
	
	// Set volume
	audio_sound_gain(_play, global.volume_sfx, 0);
	
	// Add to the list of currently playing sfx
	array_push(cAUDIO.sfx_played, _play);
}

function gfunc_audio_sfx_stop(_sound_id) {
	var _sfx = global.SFX_list[_sound_id].ID;
	
	if audio_is_playing(_sfx)
		audio_stop_sound(_sfx);
}

function gfunc_audio_sfx_play_ring() {
	if global.ring_panning == false
		gfunc_audio_sfx_play(SFXs.RING_S);
	
	else {
		if cAUDIO.ring_pan == 0
			gfunc_audio_sfx_play(SFXs.RING_L);
		else
			gfunc_audio_sfx_play(SFXs.RING_R);
	}
}