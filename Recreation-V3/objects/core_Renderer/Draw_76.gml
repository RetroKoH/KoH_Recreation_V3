/// @description Surface Initialization

// Create surfaces
if !surface_exists(surface_main)
{
	surface_main = surface_create(global.win_width, global.win_height);
	view_surface_id[0] = surface_main;
}

if !surface_exists(surface_overlay)
	surface_overlay = surface_create(global.win_width, global.win_height);

// Call main shader
shader_set(sh_Palette);