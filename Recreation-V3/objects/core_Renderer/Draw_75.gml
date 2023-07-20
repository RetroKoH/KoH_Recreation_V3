/// @description Free Surfaces
	
// Performed on room end
if !surface_reset
	return;
	
// Reset surfaces
if surface_exists(surface_low)
    surface_free(surface_low);
if surface_exists(surface_high)
    surface_free(surface_high);