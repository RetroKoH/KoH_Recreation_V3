/// @description Clear Video Memory

// You might want not to perform this between acts if you're doing S3K-like act transitions
draw_texture_flush();
	
/* Now this one is interesting. We found out there is a bug on NVIDIA GPUs which causes the surface not 
to be cleared correctly in rare cases. To fix that, the surface should be cleared when the room unloads, 
but in the Draw GUI End (!) event at the same time. This is exactly what we're doing here */
		
surface_reset = true;
event_perform(ev_gui_end, 0);

ready = false;