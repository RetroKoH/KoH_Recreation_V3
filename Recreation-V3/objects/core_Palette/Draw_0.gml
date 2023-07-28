/// @description Process Swap and Fade

// Define a render boundary between type 1 and type 2 palettes
/*if instance_exists(Stage) and Stage.WaterEnabled
{
	var Boundary = Game.Height - clamp(Camera.ViewY - Stage.WaterLevel + Game.Height, 0, Game.Height);
}
else*/
	var _boundary = global.win_height;
shader_set_uniform_f(SHADER.pal_bound, _boundary);
		
// Render palette type 1
if _boundary > 0 and color_set[PAL_PRIMARY] != false {
	texture_set_stage(SHADER.pal_tex_1,				color_set[0][0]);
	shader_set_uniform_f(SHADER.pal_tex_size_1,		color_set[0][1], color_set[0][2]);
	shader_set_uniform_f(SHADER.pal_UVs_1,			color_set[0][3], color_set[0][4], color_set[0][5]);
	shader_set_uniform_f_array(SHADER.pal_index_1,	index_1);
}
		
// Render palette type 2
if _boundary < global.win_height and color_set[PAL_PRIMARY] != false {
	texture_set_stage(SHADER.pal_tex_2,				color_set[1][0]);
	shader_set_uniform_f(SHADER.pal_tex_size_2,		color_set[1][1], color_set[1][2]);
	shader_set_uniform_f(SHADER.pal_UVs_2,			color_set[1][3], color_set[1][4], color_set[1][5]);
	shader_set_uniform_f_array(SHADER.pal_index_2,	index_2);
}
	
// Update flag
if fade_step == 0
	fade_blend = FADESTATE_MAX;

else if fade_step < 756
	fade_blend = FADESTATE_ACTIVE;

else
	fade_blend = false;

// Update value
if fade_mode and fade_step < 756
	fade_step = min(fade_step + fade_speed, 756);

else if !fade_mode and fade_step > 0
	fade_step = max(fade_step - fade_speed, 0);