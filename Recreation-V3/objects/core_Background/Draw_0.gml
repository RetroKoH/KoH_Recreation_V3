/// @description Render background

if !active exit;

var _len = array_length(layers);
for (var i = 0; i < _len; i++)
{
	var _layer = layers[i];
	
	if cRENDER.update_anims
		_layer.x_offset += _layer.speed_x;
	
	var _tex		= _layer.texture;
	var _x			= _layer.pos_x;
	var _y			= _layer.pos_y;
	var _scrX		= _layer.scroll_x;
	var _scrY		= _layer.scroll_y;
	var _animSpeed	= _layer.anim_speed;
	var _height		= _layer.tex_height;
	var _width		= _layer.tex_width;
	var _texSize	= _layer.tex_size;
	var _xoffset	= _layer.x_offset;
	
	var _drawX		= _x; // Add Camera view later
	var _drawY		= _y; // Add Camera view and scroll later.
	
	// Draw background piece
	draw_sprite(_tex, 0, _drawX, _drawY);
}