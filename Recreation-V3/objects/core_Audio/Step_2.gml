/// @description Handle BGMs

if !bgm_track
	return

var pos = audio_sound_get_track_position(bgm_track);

if loop_points[0] != -1 {
	if pos >= loop_points[1]
		audio_sound_set_track_position(bgm_track, loop_points[0] + (pos - loop_points[1]));
}

else if !audio_is_playing(bgm_track) {
	audio_event = AUEVENT_STOP;
	event_time = 0;
}

switch(audio_event)
{
	case AUEVENT_IDLE:
	break;
	
	case AUEVENT_UNMUTE:
	// Reset event
	if audio_sound_get_gain(bgm_track) == 1
	{
		audio_event = AUEVENT_IDLE;
		event_time = 0;
	}
	
	// Increase track volume
	else
	{		
		var VolumeStep  = 1 / (event_time * 60);
		var VolumeLevel = min(audio_sound_get_gain(bgm_track) + VolumeStep, 1);
				
		audio_sound_gain(bgm_track, VolumeLevel, 0);
	}
	break;

	case AUEVENT_MUTE:
	{	
		// Decrease track volume
		var VolumeStep  = 1 / (event_time * 60);
		var VolumeLevel = max(audio_sound_get_gain(bgm_track) - VolumeStep, 0);

		audio_sound_gain(bgm_track, VolumeLevel, 0);
	}
	break;
	
	case AUEVENT_STOP:
	{	
		// Stop and reset track
		if audio_sound_get_gain(bgm_track) == 0
		{
			var _track = bgm_track;
			audio_event = AUEVENT_IDLE;
			bgm_track = noone;
			event_time = 0;
			loop_points	= [-1, 0];
				
			audio_stop_sound(_track);
			audio_sound_gain(_track, global.volume_bgm, 0);
		}
		else
		{
			// Decrease track volume
			var VolumeStep  = 1 / (event_time * 60);
			var VolumeLevel = max(audio_sound_get_gain(bgm_track) - VolumeStep, 0);

			audio_sound_gain(bgm_track, VolumeLevel, 0);
		}
	}
	break;
}