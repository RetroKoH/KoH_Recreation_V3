/// @description Remove any and all SFX not currently playing

for (var _i = 0; _i < array_length(cAUDIO.sfx_played); _i++)
	if !audio_is_playing(sfx_played[_i])
		array_delete(sfx_played, _i, 1);