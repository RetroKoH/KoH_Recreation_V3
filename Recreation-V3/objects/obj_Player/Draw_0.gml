/// @description Insert description here
// You can write your code in this editor

event_inherited();

switch(global.angle_data[angle].quad_floor) {
	case COL_FLOOR:
		// Ceiling sensors (Always at x +/- width, y - height)
		draw_sprite_ext(spr_debug_line, 0,	floor(x)-width, floor(y),		1,-height,0, #0088EE,1);	// Sensor A
		draw_sprite(spr_debug_line, 0,		floor(x)-width, floor(y)-height);
		draw_sprite_ext(spr_debug_line, 0,	floor(x)+width, floor(y),		1,-height,0, c_yellow,1);	// Sensor B
		draw_sprite(spr_debug_line, 0,		floor(x)+width, floor(y)-height);
		// Floor sensors (Always at x +/- width, y - height)
		draw_sprite_ext(spr_debug_line, 0,	floor(x)-width, floor(y), 1,height,0, c_green,1);			// Sensor C
		draw_sprite(spr_debug_line, 0,		floor(x)-width, floor(y)+height);
		draw_sprite_ext(spr_debug_line, 0,	floor(x)+width, floor(y), 1,height,0, c_teal,1);			// Sensor D
		draw_sprite(spr_debug_line, 0,		floor(x)+width, floor(y)+height);
		// Push sensors (Always at x +/- 10px, y (or y + offset))
		var _y = floor(y) + ((angle < 8 or angle > $F8) ? (!spinning ? 8 : 3) : 0);
		draw_sprite_ext(spr_debug_line, 0,	floor(x),				_y, -width_push,1,0, c_fuchsia,1);	// Sensor E
		draw_sprite(spr_debug_line, 0,		floor(x)-width_push,	_y);
		draw_sprite_ext(spr_debug_line, 0,	floor(x),				_y,  width_push,1,0, c_red,1);		// Sensor F
		draw_sprite(spr_debug_line, 0,		floor(x)+width_push,	_y);
	break;
	
	case COL_WALL_R:
		// Ceiling sensors (Always at x - height, y +/- width)
		draw_sprite_ext(spr_debug_line, 0,	floor(x),			floor(y)-width, -height,1,0, #0088EE,1);	// Sensor A
		draw_sprite(spr_debug_line, 0,		floor(x)-height,	floor(y)-width);
		draw_sprite_ext(spr_debug_line, 0,	floor(x),			floor(y)+width, -height,1,0, c_yellow,1);	// Sensor B
		draw_sprite(spr_debug_line, 0,		floor(x)-height,	floor(y)+width);
		// Floor sensors (Always at x + height, y +/- width)
		draw_sprite_ext(spr_debug_line, 0,	floor(x),			floor(y)-width, height,1,0, c_green,1);		// Sensor C
		draw_sprite(spr_debug_line, 0,		floor(x)+height,	floor(y)-width);
		draw_sprite_ext(spr_debug_line, 0,	floor(x),			floor(y)+width, height,1,0, c_teal,1);		// Sensor D
		draw_sprite(spr_debug_line, 0,		floor(x)+height,	floor(y)+width);
		// Push sensors (Always at x (or x + offset), y +/- 10px)
		var _x = floor(x); //+ ((angle < 8 or angle > $F8) ? (!spinning ? 8 : 3) : 0);
		draw_sprite_ext(spr_debug_line, 0,	_x,		floor(y),			1,-width_push,0, c_fuchsia,1);		// Sensor E
		draw_sprite(spr_debug_line, 0,		_x,		floor(y)-width_push);
		draw_sprite_ext(spr_debug_line, 0,	_x,		floor(y),			1,width_push,0, c_red,1);			// Sensor F
		draw_sprite(spr_debug_line, 0,		_x,		floor(y)+width_push);
	break;
}