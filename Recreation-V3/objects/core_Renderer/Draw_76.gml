/// @description Init. Surfaces & Process Effects

if !surface_exists(surface_low)
{
	surface_low = surface_create(global.win_width + global.scrn_buffer * 2, global.win_height);
        
	surface_set_target(surface_low);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
        
	view_surface_id[0] = surface_low;
}
if !surface_exists(surface_high)
{
	surface_high = surface_create(global.win_width, global.win_height);
        
	surface_set_target(surface_high);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
}