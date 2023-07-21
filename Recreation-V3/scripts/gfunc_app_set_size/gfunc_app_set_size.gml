/// @function gfunc_app_set_size(width, height)
function gfunc_app_set_size(_width, _height){	
	// Free surfaces, they'll be re-created in the Pre-Draw Event of Renderer contoller
	if instance_exists(cRENDER)
	{
		if surface_exists(cRENDER.surface_main)
			surface_free(cRENDER.surface_main);
		if surface_exists(cRENDER.surface_overlay)
			surface_free(cRENDER.surface_overlay);
	}
	surface_resize(application_surface, _width, _height);
	
	// Update camera and its viewport size
	view_enabled[0] = true;
	view_visible[0] = true;
	
	camera_set_view_size(GAMECAM, _width + global.scrn_buffer * 2, _height);
}