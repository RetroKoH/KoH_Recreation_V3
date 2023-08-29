/// @function setup_Background_Layer(texture,x,y,scrollX,scrollY,autoXSpeed,animSpeed,[inclineHeight],[inclineStep],[inclineY]
function setup_Background_Layer(_tex, _x, _y, _scrX, _scrY, _autoXSP, _animSpeed, _incHeight=0, _incStep=0, _incY=0){	

	// Initialise autoscroll offset value
	var _offset;
	if !array_equals(global.transition_data, [])
			_offset = global.transition_data[3][array_length(layers)];
	else	_offset = 0;
	
	// Add data for this layer
	var _table_entry = {
		texture			: _tex,			// Texture sprite
		pos_x			: _x,			// starting x-position
		pos_y			: _y,			// starting y-position
		scroll_x		: _scrX,		// horizontal scroll rate
		scroll_y		: _scrY,		// vertical scroll rate
		speed_x			: _autoXSP,		// horizontal Speed
		x_offset		: _offset,		// x-position offset (actively influenced by speed_x)
		anim_speed		: _animSpeed,	// animation speed of background
		incline_height	: _incHeight,
		incline_step	: _incStep,
		incline_y		: _incY,
		tex_height		: sprite_get_height(_tex),
		tex_width		: sprite_get_width(_tex),
		tex_size		: 1 / texture_get_texel_width(sprite_get_texture(_tex, 0))
	}

	array_push(cBKG.layers, _table_entry);
}