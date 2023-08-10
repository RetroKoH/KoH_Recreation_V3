function gfunc_tile_get_length(_x, _y, _tile, _index, _mode) {
	if _mode mod 2 == 0
		gfunc_tile_get_width(_x, _y, _tile, _index);
	else
		gfunc_tile_get_height(_x, _y, _tile, _index);
}

///@function gfunc_tile_get_width(_x, _y, _tile, _index)
function gfunc_tile_get_width(_x, _y, _tile, _index) {
		var _width = _y mod 16;
		if tile_get_flip(_tile)
			_width = 16 - 1 - _width;
			
		return global.tile_widths[_index&$FF][_width];
}

///@function gfunc_tile_get_height(_x, _y, _tile, _index)
function gfunc_tile_get_height(_x, _y, _tile, _index) {
		var _height = _x mod 16;
		if tile_get_mirror(_tile)
			_height = 16 - 1 - _height;
			
		return global.tile_heights[_index&$FF][_height];

}