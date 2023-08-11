/// @description Draw Sprite

draw_self();

var _tile = tilemap_get(global.map_id[0],mouse_x div TILE_SIZE,mouse_y div TILE_SIZE);
if _tile {
	var _x = mouse_x & -TILE_SIZE, _y = mouse_y & -TILE_SIZE;
	draw_rectangle(_x, _y, _x + TILE_SIZE-1, _y + TILE_SIZE-1, true);
}

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
var _y = y + ((angle < 8 or angle > $F8) ? (spinning ? 3 : 8) : 0);

draw_sprite_ext(spr_debug_line, 0, x, _y, -10,1,0, c_fuchsia,1);			// Sensor E
draw_sprite(spr_debug_line, 0, x-10, _y);
draw_sprite_ext(spr_debug_line, 0, x, _y,  10,1,0, c_red,1);				// Sensor F
draw_sprite(spr_debug_line, 0, x+10, _y);

// Object Collision Hitbox
//var _c = c_purple; draw_set_alpha(0.75);
//draw_rectangle_color(hitbox[0],hitbox[1],hitbox[2],hitbox[3],_c,_c,_c,_c,false);
//draw_set_alpha(1);

draw_sprite(spr_debug_origin, 0, x, y);