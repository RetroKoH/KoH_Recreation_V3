///@function setup_Collision
function setup_Collision() {
	#macro TILE_SIZE	16
	#macro TILE_COUNT	256
	
	#macro COL_FLOOR	0
	#macro COL_WALL_R	1
	#macro COL_CEILING	2
	#macro COL_WALL_L	3
	
	#macro HEIGHT_MAIN	19 // $13
	#macro HEIGHT_ROLL	14 // $E
	#macro WIDTH_MAIN	9
	#macro WIDTH_ROLL	7
	
	// Load Collision Data
	global.tile_heights	= [];
	global.tile_widths	= [];
	global.tile_angles	= [];
	global.angle_data	= [];
	var _factor			= 360/256;
	
	// Heights
	var _file = file_bin_open("tiledata/heightmap.bin", 0);
	var _size = file_bin_size(_file);
	if (_file) {
		for (var _i = 0; _i < TILE_COUNT; _i++)
			for (var _j = 0; _j < TILE_SIZE; _j++) {
				var _byte = (_i * TILE_SIZE < _size) ? file_bin_read_byte(_file) : 0;
				if (_byte >= $80)	_byte = -($100-_byte);
				_byte = min(abs(_byte), $10) * sign(_byte);
				global.tile_heights[_i][_j] = _byte;
			}
		file_bin_close(_file);
	}
	
	// Widths
	_file = file_bin_open("tiledata/widthmap.bin", 0);
	_size = file_bin_size(_file);
	if (_file) {
		for (var _i = 0; _i < TILE_COUNT; _i++)
			for (var _j = 0; _j < TILE_SIZE; _j++) {
				var _byte = (_i * TILE_SIZE < _size) ? file_bin_read_byte(_file) : 0;
				if (_byte >= $80)	_byte = -($100-_byte);
				_byte = min(abs(_byte), $10) * sign(_byte);
				global.tile_widths[_i][_j] = _byte;
			}
		file_bin_close(_file);
	}

	// Angles
	_file = file_bin_open("tiledata/anglemap.bin", 0);
	_size = file_bin_size(_file);
	if (_file) {
		for (var _i = 0; _i < TILE_COUNT; _i++) {
			var _byte = _i < _size ? file_bin_read_byte(_file) : 0;
			if _byte == $FF
				global.tile_angles[_i] = 0;
			else
				global.tile_angles[_i] = 256 - _byte;
		}
		file_bin_close(_file);
	}
	
	// Angle Data
	for (var _i = 0; _i < 256; _i++) {
		var _ang = _i * _factor;
		global.angle_data[_i] = {
			angle		: _ang,
			sine		: dsin(_ang),
			cosine		: dcos(_ang),
			quad_floor	: scr_setup_angle_quadrants(0, _i),
			quad_wall	: scr_setup_angle_quadrants(1, _i)
		}
	}
}

function scr_setup_angle_quadrants(_mode, _angle) {
	// WALL MODES
	if _mode {
		if _angle < 32 or _angle >= 225			// 0-44; 316-360
			return COL_FLOOR;

		else if _angle >= 32 and _angle <= 96	// 45-135
			return COL_WALL_R;

		else if _angle >= 97 and _angle <= 159	// 136-224
			return COL_CEILING;

		else if _angle >= 160 and _angle <= 224	// 225-315
			return COL_WALL_L;
	}
	
	// FLOOR MODES
	else {
		if _angle <= 32 or _angle >= 224		// 0-45; 315-360
			return COL_FLOOR;

		else if _angle >= 33 and _angle <= 95	// 46-134
			return COL_WALL_R;

		else if _angle >= 96 and _angle <= 160	// 135-225
			return COL_CEILING;

		else if _angle >= 161 and _angle <= 223	// 226-314
			return COL_WALL_L;
	}
}