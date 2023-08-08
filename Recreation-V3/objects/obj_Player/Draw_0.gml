/// @description Insert description here
// You can write your code in this editor

draw_self();

// Ceiling sensors (Always at x +/- width, y - height)
draw_sprite_ext(spr_debug_line, 0, x-width, y, 1,-height,0, #0088EE,1);		// Sensor A
draw_sprite(spr_debug_line, 0, x-width, y-height);
draw_sprite_ext(spr_debug_line, 0, x+width, y, 1,-height,0, c_yellow,1);	// Sensor B
draw_sprite(spr_debug_line, 0, x+width, y-height);

// Floor sensors (Always at x +/- width, y - height)
draw_sprite_ext(spr_debug_line, 0, x-width, y, 1,height,0, c_green,1);		// Sensor C
draw_sprite(spr_debug_line, 0, x-width, y+height);
draw_sprite_ext(spr_debug_line, 0, x+width, y, 1,height,0, c_teal,1);		// Sensor D
draw_sprite(spr_debug_line, 0, x+width, y+height);

// Push sensors (Always at x +/- 10px, y (or y + 8))
draw_sprite_ext(spr_debug_line, 0, x, y, -10,1,0, c_fuchsia,1);				// Sensor E
draw_sprite(spr_debug_line, 0, x-10, y);
draw_sprite_ext(spr_debug_line, 0, x, y,  10,1,0, c_red,1);					// Sensor F
draw_sprite(spr_debug_line, 0, x+10, y);

// Object Collision Hitbox
//var _c = c_purple; draw_set_alpha(0.75);
//draw_rectangle_color(hitbox[0],hitbox[1],hitbox[2],hitbox[3],_c,_c,_c,_c,false);
//draw_set_alpha(1);

draw_sprite(spr_debug_origin, 0, x, y);