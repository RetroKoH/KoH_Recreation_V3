/// @description Rendering

// Draw surfaces
gpu_set_blendenable(false);
surface_set_target(application_surface);
	
if surface_exists(surface_main) 
{
	// Use shader
	shader_set(sh_Fade); {
		
		// Render palette fade
		shader_set_uniform_f(SHADER.pal_fade_step,  cPAL.fade_blend == FADEBLEND_FLASH ? cPAL.fade_step div 3 : cPAL.fade_step);
		shader_set_uniform_i(SHADER.pal_fade_color, cPAL.fade_blend);
		shader_set_uniform_i(SHADER.pal_fade_mode,  cPAL.fade_mode);

		// Render main palette surface
		draw_surface(surface_main, -global.scrn_buffer, 0);
	}
	shader_reset();
}
	
// Render overlay palette surface
if surface_exists(surface_overlay)
	draw_surface(surface_overlay, 0, 0);

// Draw application (game) surface
surface_reset_target();
application_surface_draw_enable(true);
draw_surface(application_surface, 0, 0);
application_surface_draw_enable(false);
gpu_set_blendenable(true);