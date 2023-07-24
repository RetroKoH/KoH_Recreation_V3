/// @description Render background

var _len = array_length(layers);
if !active || !_len return; //if cRENDER.update_anims

shader_set(sh_Palette);

var _transition_offset = 0;
var _scr_buffer = global.scrn_buffer;

// Apply parallax
shader_set_uniform_i(SHADER.prl_active, true);

for (var i = 0; i < _len; i++)
{
	var _layer = layers[i];
	
	// Update ScrollX offset
	_layer.x_offset += _layer.speed_x;
	
	// Get background data
	var _tex		= _layer.texture;
	var _x			= _layer.pos_x;
	var _y			= _layer.pos_y;
	var _scrX		= _layer.scroll_x;
	var _scrY		= _layer.scroll_y;
	var _xoffset	= _layer.x_offset;
	var _animSpeed	= _layer.anim_speed;
	var _incHeight	= _layer.incline_height
	var _incStep	= _layer.incline_step
	var _incY		= _layer.incline_y
	var _height		= _layer.tex_height;
	var _width		= _layer.tex_width;
	var _texSize	= _layer.tex_size;
	
	var _drawX		= cCAMERA.view_x + _x - _scr_buffer;
	var _drawY		= floor(cCAMERA.view_y * (1 - _scrY)) + _y;
	
	// Set y-scale mode properties
	var _Yscale = 1;
	//if _incY and global.stage
	//	_Yscale = clamp((0 - _drawY) / _height, -1, 1); // The 0 is Water Level
	
	// Not animated for now
	
	// Transfer data to the shader
	if _incHeight != 0 
	{
		if _incStep < 0
			shader_set_uniform_f(SHADER.prl_inc_height, abs(_height));

		shader_set_uniform_f(SHADER.prl_inc_step,	_incStep / _scrX);
		shader_set_uniform_f(SHADER.prl_inc_height,	_incHeight);
		shader_set_uniform_f(SHADER.prl_scaleY,		_Yscale);
	}
	shader_set_uniform_f(SHADER.prl_offset,		cCAMERA.view_x * _scrX - _xoffset + _transition_offset * _scrX, _scr_buffer);
	shader_set_uniform_f(SHADER.prl_pos,		_drawX, _drawY);
	shader_set_uniform_f(SHADER.prl_width,		_width);
	shader_set_uniform_f(SHADER.prl_map_size,	_texSize);
	
	// Draw background piece
	if _incY
		draw_sprite_ext(_tex, 0, _drawX, _drawY, 1, _Yscale, 0, c_white, 1);
	else
		draw_sprite(_tex, 0, _drawX, _drawY);
		
	if _incHeight != 0 
		shader_set_uniform_f(SHADER.prl_inc_height, 0);
}

// Stop parallax
shader_set_uniform_i(SHADER.prl_active, false);

shader_reset();