
function gfunc_collide_dist(_x, _y, _quadrant, _full_solid) {
	// Get tile size mask
	var _size_mask = TILE_SIZE - 1; // 15 ($F)

	// Get sensor position
	var _sensor_x = gfunc_collide_get_sensor_x(_quadrant, _x, _y);
	var _sensor_y = gfunc_collide_get_sensor_y(_quadrant, _x, _y);
	
	// Choose which axis to use
	var _anchor = _sensor_y;		// FLOOR and CEILING
	if ((_quadrant & 1) == 1)
		_anchor = _sensor_x;		// WALLS
	
	// Get tile and index
	var _tile = tilemap_get(global.map_id[path], _sensor_x div TILE_SIZE, _sensor_y div TILE_SIZE);
	var _index = tile_get_index(_tile);
	
	// If no tile, or if tile is top-solid when we need fully solid
    if (!_tile || (_index >= $100 and _full_solid))
        return gfunc_collide_dist_adj(_sensor_x, _sensor_y, _quadrant, 1, _full_solid);	// + TILE_SIZE;
	
	var _len = gfunc_tile_get_length(_tile, _index, _sensor_x, _sensor_y, _quadrant);
	
	// Check length
	if (_len == 0) // 0 length (Empty)
		return gfunc_collide_dist_adj(_sensor_x, _sensor_y, _quadrant, 1, _full_solid);// + TILE_SIZE;

	else if (_len < 0) {
		// Negative length
		if (_len + (_anchor & _size_mask) >= 0)
			return gfunc_collide_dist_adj(_sensor_x, _sensor_y, _quadrant, 1, _full_solid);// + TILE_SIZE;
		return gfunc_collide_dist_adj(_sensor_x, _sensor_y, _quadrant, -1, _full_solid);// - TILE_SIZE;
	}

	else if (_len == TILE_SIZE) // Max length
		return gfunc_collide_dist_adj(_sensor_x, _sensor_y, _quadrant, -1, _full_solid);// - TILE_SIZE;

	// Normal length
    var _distance = _size_mask - (_len + (_anchor & _size_mask));
	
	// Acquire Angle
	var _angle = gfunc_tile_get_angle(_tile, _index, _quadrant);
	
	// RETURNS Length and Angle in an array (Orbinaut)
	return [_distance, _angle];
}

function gfunc_collide_dist_adj(_sensor_x, _sensor_y, _quadrant, _dir, _full_solid) {
	// Continued checking for finding the distance from a tile at any given direction, if needed
 
    // Get tile size mask
    var _size_mask = TILE_SIZE - 1
	var _anchor;
 
	// Reposition sensor to adjacent block and choose which axis to use
	switch(_quadrant)
	{
		case COL_FLOOR:
		case COL_CEILING:
			_sensor_y += TILE_SIZE * _dir * ((_quadrant > 1) ? -1 : 1);
			_anchor = _sensor_y;
			break;
 
		case COL_WALL_R:
		case COL_WALL_L:
			_sensor_x += TILE_SIZE * _dir * ((_quadrant > 1) ? -1 : 1);
			_anchor = _sensor_x;
			break;
	}
 
    // Get tile
    var _tile = tilemap_get(global.map_id[path], _sensor_x div TILE_SIZE, _sensor_y div TILE_SIZE);
	var _index = tile_get_index(_tile);

	// If no tile, or if tile is top-solid when we need fully solid
    if (!_tile || (_index>=$100 && _full_solid))
        return [_size_mask - (_anchor & _size_mask) + (TILE_SIZE * _dir), 0];

    var _len = gfunc_tile_get_length(_tile, _index, _sensor_x, _sensor_y, _quadrant);
 
    // Check length
    if (_len == 0)
    {
        // 0 length
        return [_size_mask - (_anchor & _size_mask) + (TILE_SIZE * _dir), 0];
    }
    else if (_len < 0)
    {
        // Negative length
        var _neg_dist = _len + (_anchor & _size_mask);

        if (_neg_dist >= 0)
            return [_size_mask - (_anchor & _size_mask) + (TILE_SIZE * _dir), 0];
        else {
			var _angle = gfunc_tile_get_angle(_tile, _index, _quadrant);	// Is this correct?
			return [~_neg_dist + (TILE_SIZE * _dir), _angle];
		}
    }
 
    // Normal length
    var _distance = _size_mask - (_len + (_anchor & _size_mask));
	
	// Acquire Angle
	var _angle = gfunc_tile_get_angle(_tile, _index, _quadrant);
	
	// RETURNS Length and Angle in an array (Orbinaut)
	return [_distance + (TILE_SIZE * _dir), _angle];
}

function gfunc_collide_dist_floor(_sensor_x, _sensor_y, _quadrant) {
  return gfunc_collide_dist(_sensor_x, _sensor_y, _quadrant, false);
}

function gfunc_collide_dist_rightwall(_sensor_x, _sensor_y, _quadrant) {
  return gfunc_collide_dist(-_sensor_y, _sensor_x, (_quadrant + 1) & 3, true);
}

function gfunc_collide_dist_ceiling(_sensor_x, _sensor_y, _quadrant) {
  return gfunc_collide_dist(-_sensor_x, -_sensor_y, (_quadrant + 2) & 3, true);
}

function gfunc_collide_dist_leftwall(_sensor_x, _sensor_y, _quadrant) {
  return gfunc_collide_dist(_sensor_y, -_sensor_x, (_quadrant + 3) & 3, true);
}

function gfunc_collide_get_sensor_x(_quadrant, _offset_x, _offset_y) {
	switch (_quadrant) {
		case COL_FLOOR:
			return floor(x) + _offset_x;
		case COL_WALL_R:
			return floor(x) + _offset_y;
		case COL_CEILING:
			return floor(x) - _offset_x;
		case COL_WALL_L:
			return (floor(x) - _offset_y) ^ (TILE_SIZE - 1);
	}
}

function gfunc_collide_get_sensor_y(_quadrant, _offset_x, _offset_y) {
	switch (_quadrant) {
		case COL_FLOOR:
			return floor(y) + _offset_y;
		case COL_WALL_R:
			return floor(y) - _offset_x;
		case COL_CEILING:
			return (floor(y) - _offset_y) ^ (TILE_SIZE - 1);
		case COL_WALL_L:
			return floor(y) + _offset_x;
	}
}

function gfunc_tile_get_length(_tile, _index, _sensor_x, _sensor_y, _quadrant) {
	var _length;
	
	switch (_quadrant)
	{
		case COL_FLOOR:
		case COL_CEILING:
			_length = gfunc_tile_get_height(_tile, _index, _sensor_x) * ((_quadrant > 1) ? -1 : 1);
			break;
		case COL_WALL_R:
		case COL_WALL_L:
			_length = gfunc_tile_get_width(_tile, _index, _sensor_y) * ((_quadrant > 1) ? -1 : 1);
			break;
	}
	
	if (_length == -TILE_SIZE)
		_length = TILE_SIZE;
	return _length;
}

function gfunc_tile_get_width(_tile, _index, _row) {
	var _width = 0;

	if tile_get_flip(_tile)
		_width = global.tile_widths[_index&$FF][(~_row)&(TILE_SIZE-1)];
	else
		_width = global.tile_widths[_index&$FF][_row&(TILE_SIZE-1)];       

	if tile_get_mirror(_tile) _width = -_width;
    
	return _width;
}

function gfunc_tile_get_height(_tile, _index, _column) {
	var _height = 0;

	if tile_get_mirror(_tile)
		_height = global.tile_heights[_index&$FF][(~_column)&(TILE_SIZE-1)];
	else
		_height = global.tile_heights[_index&$FF][_column&(TILE_SIZE-1)];       

	if tile_get_flip(_tile) _height = -_height;
    
	return _height;
}

function gfunc_tile_get_angle(_tile, _index, _quadrant) {
    var _ang = global.tile_angles[_index&$FF];

    if tile_get_mirror(_tile)
        _ang = gfunc_wrap_angle(-_ang);
    
    if tile_get_flip(_tile)
        _ang = gfunc_wrap_angle(-(_ang - $40) + $40);
	
	if _ang == 0
		switch(_quadrant) {
			case COL_FLOOR:		_ang = $00; break;
			case COL_WALL_R:	_ang = $40; break;
			case COL_CEILING:	_ang = $80; break;
			case COL_WALL_L:	_ang = $C0; break;
		}

    return _ang;
}