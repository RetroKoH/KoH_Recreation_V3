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