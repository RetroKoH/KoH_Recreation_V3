/// @description Reset Camera

// Reinitialize variables
event_perform(ev_create, 0);

// Set the Camera (Move to spawn object?)
if instance_exists(cPLAYER) {
	pos_x = cPLAYER.x - global.win_width  / 2;
	pos_y = cPLAYER.y - global.win_height / 2 + 16;
}

// Adjust surfaces and camera view to game resolution	
gfunc_app_set_size(global.win_width, global.win_height);