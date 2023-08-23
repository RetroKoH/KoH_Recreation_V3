/// @description Render Sprite

if !((invuln) and (invuln % 4)) {
	if speed_up and abs(inertia) >= 4 {
		for (var _i = 0; _i < 4; _i++)
		{
			var _offset	= max(0, pos_offsets[_i] - 1);
			var _x		= ds_list_find_value(pos_record_x, _offset);
			var _y		= ds_list_find_value(pos_record_y, _offset);
		
			// --- Draw main animation -----------------------------------------------------
			draw_sprite_ext(anim_sprite, floor(anim_spriteframe), _x, _y,
							anim_direction*anim_xscale, anim_yscale, anim_angle,
							c_white, alphas[_i]);
		}
	}
	else gfunc_anims_draw();
}

if global.debugmode {
	draw_set_alpha(0.4);
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_fuchsia, c_fuchsia,c_fuchsia,c_fuchsia, false);
	draw_set_alpha(1);

	if in_air {
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
	}

	else switch(global.angle_data[angle].quad_floor) {
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
	
		case COL_CEILING:
			// Ceiling sensors (Always at x +/- width, y - height)
			draw_sprite_ext(spr_debug_line, 0,	floor(x)-width, floor(y),		1,height,0, #0088EE,1);		// Sensor A
			draw_sprite(spr_debug_line, 0,		floor(x)-width, floor(y)+height);
			draw_sprite_ext(spr_debug_line, 0,	floor(x)+width, floor(y),		1,height,0, c_yellow,1);	// Sensor B
			draw_sprite(spr_debug_line, 0,		floor(x)+width, floor(y)+height);
			// Floor sensors (Always at x +/- width, y - height)
			draw_sprite_ext(spr_debug_line, 0,	floor(x)+width, floor(y), 1,-height,0, c_green,1);			// Sensor C
			draw_sprite(spr_debug_line, 0,		floor(x)+width, floor(y)-height);
			draw_sprite_ext(spr_debug_line, 0,	floor(x)-width, floor(y), 1,-height,0, c_teal,1);			// Sensor D
			draw_sprite(spr_debug_line, 0,		floor(x)-width, floor(y)-height);
			// Push sensors (Always at x +/- 10px, y (or y + offset))
			var _y = floor(y); //+ ((angle < 8 or angle > $F8) ? (!spinning ? 8 : 3) : 0);
			draw_sprite_ext(spr_debug_line, 0,	floor(x),				_y, width_push,1,0, c_fuchsia,1);	// Sensor E
			draw_sprite(spr_debug_line, 0,		floor(x)+width_push,	_y);
			draw_sprite_ext(spr_debug_line, 0,	floor(x),				_y, -width_push,1,0, c_red,1);		// Sensor F
			draw_sprite(spr_debug_line, 0,		floor(x)-width_push,	_y);
		break;
	
		case COL_WALL_L:
			// Ceiling sensors (Always at x - height, y +/- width)
			draw_sprite_ext(spr_debug_line, 0,	floor(x),			floor(y)+width, height,1,0, #0088EE,1);		// Sensor A
			draw_sprite(spr_debug_line, 0,		floor(x)+height,	floor(y)+width);
			draw_sprite_ext(spr_debug_line, 0,	floor(x),			floor(y)-width, height,1,0, c_yellow,1);	// Sensor B
			draw_sprite(spr_debug_line, 0,		floor(x)+height,	floor(y)-width);
			// Floor sensors (Always at x + height, y +/- width)
			draw_sprite_ext(spr_debug_line, 0,	floor(x),			floor(y)+width, -height,1,0, c_green,1);	// Sensor C
			draw_sprite(spr_debug_line, 0,		floor(x)-height,	floor(y)+width);
			draw_sprite_ext(spr_debug_line, 0,	floor(x),			floor(y)-width, -height,1,0, c_teal,1);		// Sensor D
			draw_sprite(spr_debug_line, 0,		floor(x)-height,	floor(y)-width);
			// Push sensors (Always at x (or x + offset), y +/- 10px)
			var _x = floor(x); //+ ((angle < 8 or angle > $F8) ? (!spinning ? 8 : 3) : 0);
			draw_sprite_ext(spr_debug_line, 0,	_x,		floor(y),			1,width_push,0, c_fuchsia,1);		// Sensor E
			draw_sprite(spr_debug_line, 0,		_x,		floor(y)+width_push);
			draw_sprite_ext(spr_debug_line, 0,	_x,		floor(y),			1,-width_push,0, c_red,1);			// Sensor F
			draw_sprite(spr_debug_line, 0,		_x,		floor(y)-width_push);
		break;
	}
}