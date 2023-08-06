function gfunc_gameobj_find_tile(_sensor_x, _sensor_y, _col_layer, _dir, _quadrant, _full_solid){
	// Floor positions
	_sensor_x = floor(_sensor_x);
	_sensor_y = floor(_sensor_y);
	
	// Get search direction sign
	var _shift	= 0;
	
	// Get tile layer
	var _layer = global.map_id[_col_layer];
	
	// Get tile at position
	var _tile	= tilemap_get(_layer, _sensor_x div 16, _sensor_y div 16);	
	var _index	= tile_get_index(_tile);
	var _length	= gfunc_tile_get_length(_sensor_x, _sensor_y, _tile, _index, _quadrant);

	// If no tile found, get a tile away from the player
	if _length == 0 {
		_shift	= 16;
		_tile	= tilemap_get(_layer, (_sensor_x + _shift * _dir) div 16, _sensor_y div 16);
		_index	= tile_get_index(_tile);
		_length	= gfunc_tile_get_length(_sensor_x, _sensor_y, _tile, _index, _quadrant);
	}

	// If tile found is the full one, try to find a tile closer to the player
	else if _length == 16 {
		var _prev = [_tile, _index, _length];
		_shift	= -16;
		_tile	= tilemap_get(_layer, (_sensor_x + _shift * _dir) div 16, _sensor_y div 16);
		_index	= tile_get_index(_tile);
		_length	= gfunc_tile_get_length(_sensor_x, _sensor_y, _tile, _index, _quadrant);
		
		// If no tile has been found, revert back to the initial tile	
		if _length == 0
		{
			_shift = 0;
			_tile	= _prev[0];
			_index	= _prev[1];
			_length	= _prev[2];
		}
	}
	
	// Return blank values if target tile is top-solid tile and we're ignoring it
	if (_index>=$100 && _full_solid)
		return [32, noone];
	
	// Calculate distance to edge of the found tile??? I thought we had distance already?
	var _dist;
	
	if _dir == 1
		_dist = ((_sensor_x + _shift * _dir) & -16) + (16 - _length - 1) - _sensor_x;
	
	else
		_dist = _sensor_x - (((_sensor_x + _shift * _dir) & -16) + _length);
	
	// Get found tile's angle
	var _ang = gfunc_tile_get_angle(_tile, _index);
	
	// Return data (Distance and Angle)
	return [_dist, _ang];
}