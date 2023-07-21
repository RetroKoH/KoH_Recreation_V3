/// @description Clear Video Memory

draw_texture_flush();
surface_reset = true;
event_perform(ev_gui_end, 0);