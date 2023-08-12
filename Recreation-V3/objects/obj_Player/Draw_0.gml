/// @description Insert description here
// You can write your code in this editor

event_inherited();

// Ceiling sensors (Always at x +/- width, y - height)
draw_sprite_ext(spr_debug_line, 0, floor(x)-width, floor(y), 1,-height,0, #0088EE,1);	// Sensor A
draw_sprite(spr_debug_line, 0, floor(x)-width, floor(y)-height);
draw_sprite_ext(spr_debug_line, 0, floor(x)+width, floor(y), 1,-height,0, c_yellow,1);	// Sensor B
draw_sprite(spr_debug_line, 0, floor(x)+width, floor(y)-height);
// Floor sensors (Always at x +/- width, y - height)
draw_sprite_ext(spr_debug_line, 0, floor(x)-width, floor(y), 1,height,0, c_green,1);	// Sensor C
draw_sprite(spr_debug_line, 0, floor(x)-width, floor(y)+height);
draw_sprite_ext(spr_debug_line, 0, floor(x)+width, floor(y), 1,height,0, c_teal,1);		// Sensor D
draw_sprite(spr_debug_line, 0, floor(x)+width, floor(y)+height);
// Push sensors (Always at x +/- 10px, y (or y + 8))
var _y = floor(y) + ((angle < 8 or angle > $F8) ? (!spinning ? 8 : 3) : 0);
draw_sprite_ext(spr_debug_line, 0, floor(x), _y, -width_push,1,0, c_fuchsia,1);			// Sensor E
draw_sprite(spr_debug_line, 0, floor(x)-10, _y);
draw_sprite_ext(spr_debug_line, 0, floor(x), _y,  width_push,1,0, c_red,1);				// Sensor F
draw_sprite(spr_debug_line, 0, floor(x)+10, _y);