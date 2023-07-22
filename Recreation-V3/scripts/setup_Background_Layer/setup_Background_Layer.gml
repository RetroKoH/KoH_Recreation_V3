/// @function setup_Background_Layer(texture,x,y,scrollX,scrollY,autoXSpeed,animSpeed,[inclineHeight],[inclineStep],[inclineY]
function setup_Background_Layer(_tex, _x, _y, _scrX, _scrY, _autoXSP, _animSpeed){	
	// Add data for this layer
	var _table_entry = {
		texture			: _tex,			// Texture asset file
		pos_x			: _x,			// starting x-position
		pos_y			: _y,			// starting y-position
		scroll_x		: _scrX,		// Unused
		scroll_y		: _scrY,		// Unused
		speed_x			: _autoXSP,		// Horizontal Speed
		x_offset		: 0,			// Offset (actively influenced by speed_x)
		anim_speed		: _animSpeed,	// Animation speed of background
		// Add incline data
		tex_height		: sprite_get_height(_tex),
		tex_width		: sprite_get_width(_tex),
		tex_size		: 1 / texture_get_texel_width(sprite_get_texture(_tex, 0))
	}

	array_push(cBKG.layers, _table_entry);
}