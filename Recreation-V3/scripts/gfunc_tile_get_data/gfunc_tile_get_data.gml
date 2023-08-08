///@function gfunc_tile_get_length(_x, _y, _tile, _index, _quadrant)
function gfunc_tile_get_length(_x, _y, _tile, _index, _quadrant){
switch(_quadrant) {

		case COL_FLOOR:
		case COL_CEILING:
			var _width = _y mod 16;
			if tile_get_flip(_tile)
				_width = 16 - 1 - _width;
			
			return global.tile_widths[_index&$FF][_width];


		case COL_WALL_R:
		case COL_WALL_L:
			var _height = _x mod 16;
			if tile_get_mirror(_tile)
				_height = 16 - 1 - _height;
			
			return global.tile_heights[_index&$FF][_height];

	}
}