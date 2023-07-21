/// @description Rendering

// Process fading
if fade_mode and fade_step < 756
{
	fade_step = min(fade_step + fade_speed, 756);
}
else if !fade_mode and fade_step > 0
{
	fade_step = max(fade_step - fade_speed, 0);
}

// Draw surfaces
surface_set_target(application_surface);
draw_clear_alpha(c_white, 0);
	
if surface_exists(surface_main) 
{
	// Use shader
	shader_set(sh_Palette);
		
	// Render palette fade
	shader_set_uniform_f(SHADER.pal_fade_step,  fade_blend == FADEBLEND_FLASH ? fade_step div 3 : fade_step);
	shader_set_uniform_i(SHADER.pal_fade_color, fade_blend);
	shader_set_uniform_i(SHADER.pal_fade_mode,  fade_mode);

	// Render main palette surface
	draw_surface(surface_main, 0, 0);
	shader_reset();
}
	
// Render overlay palette surface
if surface_exists(surface_overlay)
	draw_surface(surface_overlay, 0, 0);

surface_reset_target();
	
// Draw application (game) surface
application_surface_draw_enable(true);
draw_surface(application_surface, 0, 0);
application_surface_draw_enable(false);