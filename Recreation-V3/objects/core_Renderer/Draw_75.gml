/// @description Surface Reset

/* This script will be called on room end */
if !surface_reset
	return;
	
// Reset surfaces
if surface_exists(surface_main) 
    surface_free(surface_main);
if surface_exists(surface_overlay) 
    surface_free(surface_overlay);

surface_reset = false;
fade_step	= 756;
fade_mode	= 1;
fade_blend	= 0;
fade_speed	= 0;