/// @description Surface Initialization

// Create surfaces
if !surface_exists(surface_main) {
	surface_main = surface_create(global.win_width  + global.scrn_buffer * 2, global.win_height);
	
	surface_set_target(surface_main);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
	
	view_surface_id[0] = surface_main;
}

if !surface_exists(surface_overlay) {
	surface_overlay = surface_create(global.win_width, global.win_height);
	
	surface_set_target(surface_overlay);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
}

// Call main shader
shader_set(sh_Palette);