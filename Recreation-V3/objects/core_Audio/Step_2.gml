/// @description Handle BGMs

#region Primary Process
{
	// Exit if no track is playing
	if !bgm_track
		return;
	
	// Get track data
	var _event		= audio_event;
	var _track		= bgm_track;
	var _event_time	= event_time;
	var _loop_start	= loop_start;
	var _loop_end	= loop_end;

	// Loop track
	var _pos = audio_sound_get_track_position(_track); track_pos = _pos;
	if _loop_start != -1 {
		if _pos >= _loop_end
			audio_sound_set_track_position(_track, _loop_start + (_pos - _loop_end));
	}
	else if !audio_is_playing(_track) {
		audio_event = AUEVENT_STOP;
		event_time = 0;
	}

	switch(_event)
	{
		case AUEVENT_IDLE:
		break;
	
		case AUEVENT_UNMUTE:
		// Reset event
		if audio_sound_get_gain(_track) == 1
		{
			audio_event = AUEVENT_IDLE;
			event_time = 0;
		}
	
		// Increase track volume
		else
		{		
			var VolumeStep  = 1 / (_event_time * 60);
			var VolumeLevel = min(audio_sound_get_gain(_track) + VolumeStep, 1);
				
			audio_sound_gain(_track, VolumeLevel, 0);
		}
		break;

		case AUEVENT_MUTE:
		{	
			// Decrease track volume
			var VolumeStep  = 1 / (_event_time * 60);
			var VolumeLevel = max(audio_sound_get_gain(_track) - VolumeStep, 0);

			audio_sound_gain(_track, VolumeLevel, 0);
		}
		break;
	
		case AUEVENT_STOP:
		{	
			// Stop and reset track
			if audio_sound_get_gain(_track) == 0
			{
				audio_event	= AUEVENT_IDLE;
				bgm_track	= noone;
				track_pos = 0;
				event_time	= 0;
				loop_start	= -1;
				loop_end	= 0;
				
				audio_stop_sound(_track);
				audio_sound_gain(_track, global.volume_bgm, 0);
			}
			else
			{
				// Decrease track volume
				var VolumeStep  = 1 / (_event_time * 60);
				var VolumeLevel = max(audio_sound_get_gain(_track) - VolumeStep, 0);

				audio_sound_gain(_track, VolumeLevel, 0);
			}
		}
		break;
	}
}
#endregion

#region Secondary Process
{
	if !s_bgm_track
		return
	
	// Get secondary track data
	var _event		= s_audio_event;
	var _track		= s_bgm_track;
	var _event_time	= s_event_time;
	
	// Automatically mute and unmute primary track
	if _track and _event != AUEVENT_MUTE and _event != AUEVENT_STOP
	{
		audio_event = AUEVENT_MUTE;
		event_time = 0;
	}
	else if audio_event == AUEVENT_MUTE
	{
		audio_event = AUEVENT_UNMUTE;
		event_time = 1;
	}
	
	var pos = audio_sound_get_track_position(_track); s_track_pos = pos;
	
	// Stop track once it finished playing
	if !audio_is_playing(_track) {
		s_audio_event = AUEVENT_STOP;
		s_event_time = 0;
	}
	
	switch(_event)
	{
		case AUEVENT_IDLE:
		break;
		
		case AUEVENT_UNMUTE:
		{
			// Reset event
			if audio_sound_get_gain(_track) == 1
			{
				s_audio_event = AUEVENT_IDLE;
				s_event_time = 0;
			}
		
			// Increase track volume
			else
			{
				var VolumeStep  = 1 / (_event_time * 60);
				var VolumeLevel = min(audio_sound_get_gain(_track) + VolumeStep, 1);
			
				audio_sound_gain(_track, VolumeLevel, 0);
			}
		}
		break;
		
		case AUEVENT_MUTE:
		{
			// Decrease track volume
				var VolumeStep  = 1 / (_event_time * 60);
				var VolumeLevel = max(audio_sound_get_gain(_track) - VolumeStep, 0);

				audio_sound_gain(_track, VolumeLevel, 0);
		}
		break;
		
		case AUEVENT_STOP:
		{
			// Stop and reset track
			if !audio_is_playing(_track) or audio_sound_get_gain(_track) == 0
			{		
				s_audio_event = AUEVENT_IDLE;
				s_bgm_track = noone;
				s_event_time = 0;
				
				audio_stop_sound(_track);
				audio_sound_gain(_track, global.volume_bgm, 0);
			}
			
			// Decrease track volume
			else
			{
				var VolumeStep  = 1 / (_event_time * 60);
				var VolumeLevel = max(audio_sound_get_gain(_track) - VolumeStep, 0);

				audio_sound_gain(_track, VolumeLevel, 0);
			}
		}
		break;
	}
}
#endregion
