/// @description Handle Surfaces

gpu_set_blendenable(false);
surface_set_target(application_surface);

// Render first surface
if surface_exists(surface_low)
{
	shader_set(sh_Fade);
	{
		shader_set_uniform_f(SHADER.pal_fade_value,	cPALETTE.fade_blend == FADEBLEND_FLASH ? cPALETTE.fade_value div 3 : cPALETTE.fade_value);
		shader_set_uniform_i(SHADER.pal_fade_color,	cPALETTE.fade_blend);
		shader_set_uniform_i(SHADER.pal_fade_mode,	cPALETTE.fade_mode);
			
		draw_surface(surface_low, -global.scrn_buffer, 0);
	}
	shader_reset();
}

// Render second surface
if surface_exists(surface_high)
	draw_surface(surface_high, 0, 0);

surface_reset_target();
application_surface_draw_enable(true);
	
// Draw application (game) surface
draw_surface(application_surface, 0, 0); application_surface_draw_enable(false);
gpu_set_blendenable(true);
