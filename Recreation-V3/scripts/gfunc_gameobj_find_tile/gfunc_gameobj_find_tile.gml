///@function gfunc_gameobj_find_tile(_sensor_x, _sensor_y, _col_layer, _dir, _quadrant, _full_solid)
function gfunc_gameobj_find_tile(_sensor_x, _sensor_y, _col_layer, _dir, _quadrant, _full_solid){
	// Set initial anchor positions
	var _anchor_x = _sensor_x;
	var _anchor_y = _sensor_y;
	
	// Get search direction sign
	var _shift	= 0;
	
	// Get tile layer
	var _layer = global.map_id[_col_layer];
	
	// Get tile at position
	var _tile	= tilemap_get(_layer, _anchor_x div 16, _anchor_y div 16);	
	var _index	= tile_get_index(_tile);
	
	// Get correct height/width array based on position
	var _length	= gfunc_tile_get_length(_anchor_x, _anchor_y, _tile, _index, _quadrant);
	
	// If no tile surface is found, get a tile away from the player (EXTENSION)
	if _length == 0 {
		_shift	= 16;
		if _quadrant mod 2	_anchor_y += _shift * _dir; // L/R WALL MODE CHECK
		else				_anchor_x += _shift * _dir; // FLOOR/CEIL MODE CHECK
		
		_tile	= tilemap_get(_layer, _anchor_x div 16, _anchor_y div 16);
		_index	= tile_get_index(_tile);
		_length	= gfunc_tile_get_length(_anchor_x, _anchor_y, _tile, _index, _quadrant);
	}
	
	// If tile surface found is full, try to find a tile closer to the player (REGRESSION)
	else if _length == 16 {
		var _prev = [_tile, _index, _length];	// Store initial tile

		_shift	= -16;
		if _quadrant mod 2	_anchor_y += _shift * _dir; // L/R WALL MODE CHECK
		else				_anchor_x += _shift * _dir; // FLOOR/CEIL MODE CHECK

		_tile	= tilemap_get(_layer, _anchor_x div 16, _anchor_y div 16);
		_index	= tile_get_index(_tile);
		_length	= gfunc_tile_get_length(_anchor_x, _anchor_y, _tile, _index, _quadrant);


		// If no tile has been found, revert back to the initial tile	
		if _length == 0
		{
			if _quadrant mod 2	_anchor_y -= _shift * _dir; // L/R WALL MODE CHECK
			else				_anchor_x -= _shift * _dir; // FLOOR/CEIL MODE CHECK
			
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
	
	// L/R WALL MODE CHECK
	if _quadrant mod 2 {
		if _dir == 1
			_dist = (_anchor_y & -16) + (16 - _length - 1) - _sensor_y;
	
		else
			_dist = _sensor_y - ((_anchor_y & -16) + _length);
	}

	// FLOOR/CEIL MODE CHECK
	else {
		if _dir == 1
			_dist = (_anchor_x & -16) + (16 - _length - 1) - _sensor_x;
	
		else
			_dist = _sensor_x - ((_anchor_x & -16) + _length);
	}
	
	// Return data (Distance and Angle)
	return [_dist, 0];
}