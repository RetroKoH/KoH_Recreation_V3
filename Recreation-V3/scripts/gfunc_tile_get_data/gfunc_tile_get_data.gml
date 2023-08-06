function gfunc_tile_get_length(_x, _y, _tile, _index, _quadrant){
	switch(_quadrant) {
		case COL_FLOOR:
		case COL_CEILING:
			var _width = _y mod 16;
			if tile_get_flip(_tile)
				_width = 16 - 1 - _width;
			
			return global.tile_widths[_index&$FF][_width];
		break;
		
		case COL_WALL_R:
		case COL_WALL_L:
			var _height = _x mod 16;
			if tile_get_mirror(_tile)
				_height = 16 - 1 - _height;
			
			return global.tile_heights[_index&$FF][_height];
		break;
	}
}

function gfunc_tile_get_angle(_tile, _index) {
	var _ang = global.tile_angles[_index&$FF];

    if tile_get_mirror(_tile)
        _ang = gfunc_wrap_angle(-_ang);
    
    if tile_get_flip(_tile)
        _ang = gfunc_wrap_angle(-(_ang - 90) + 90);

    return _ang;
}