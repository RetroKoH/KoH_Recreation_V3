/// @description Reset Camera

// Reinitialize variables
event_perform(ev_create, 0);

// Adjust surfaces and camera view to game resolution	
gfunc_app_set_size(global.win_width, global.win_height);