/// @function gfunc_palette_load(palType, list)
function gfunc_palette_load(palType, list){
	// Do not load palette list if not given
	if !sprite_exists(list)
	{
		color_set[palType] = false;
		return;
	}
	
	// Do texture and texel initialisation
	var tex		= sprite_get_texture(list, 0);
	var UVs		= sprite_get_uvs(list, 0);
	var texel_x	= texture_get_texel_width(tex);
	var texel_y = texture_get_texel_height(tex);
	
	// Load data into the palette slot
	color_set[palType] = [tex, texel_x, texel_y, UVs[0] + texel_x / 2, UVs[1] + texel_y / 2, UVs[3]];
}