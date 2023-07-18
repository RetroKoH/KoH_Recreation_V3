/// @description Insert description here
// You can write your code in this editor

default_track	= BGMs.TITLE;
ring_pan = 0;	// Alternates between 0 (left) and 1 (right);

/* Value Table Reference
------------------------
	[0] - Event
	[1] - Track ID - Not asset ID!
	[2] - Event Time
	[3] - Loop Data
------------------------
*/
// Set data
audio_event		= AUEVENT_IDLE;
bgm_track		= noone;
track_pos		= 0;
event_time		= 0;
loop_start		= -1;
loop_end		= 0;
// Second mode (Used for 1-Up jingle)
s_audio_event	= AUEVENT_IDLE;
s_bgm_track		= noone;
s_track_pos		= -1;
s_event_time	= 0;