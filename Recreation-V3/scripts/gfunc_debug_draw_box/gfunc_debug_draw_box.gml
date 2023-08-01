///@function gfunc_debug_draw_box(type,color)
function gfunc_debug_draw_box(_type,_col){
// Draw collision box information. The box will display the object's bounding box.
	/* The color of the bounding box will tell what type of object it is.
	   White   - Solid
	   Red     - Harmful
	   Purple  - Enemy
	   Green   - Special
	   Some objects have a second bounding box, for tile collision.
	   Fuschia - Tile collision.
	*/

	if !global.debugmode exit;

	// Draw tile collision box created by width and height with fuschia.
	if _type == 1
	{
	    // Transparent collision box
	    draw_set_alpha(.25);
	    draw_rectangle_color(floor(x)-width,floor(y)-height,floor(x)+width,floor(y)+height,
	                        c_fuchsia,c_fuchsia,c_fuchsia,c_fuchsia,false);
	    // Opaque collision box outline
	    draw_set_alpha(1);
	    draw_rectangle_color(floor(x)-width,floor(y)-height,floor(x)+width,floor(y)+height,
	                        c_fuchsia,c_fuchsia,c_fuchsia,c_fuchsia,true);
	}

	// Draw collision box with the designated color, based on object collision type.
	if (_type == 0 || _type == 1)
	{
	    // Transparent collision box
	    draw_set_alpha(.25);
	    draw_rectangle_color(
	                        (floor(x)-((sprite_width-sprite_width)+(floor(x)-floor(bbox_left)))),
	                        (floor(y)-((sprite_height-sprite_height)+(floor(y)-floor(bbox_top)))),
	                        (floor(x)+((sprite_width-sprite_width)+(floor(bbox_right)-floor(x)))),
	                        (floor(y)+((sprite_height-sprite_height)+(floor(bbox_bottom)-floor(y)))),
	                         _col,_col,_col,_col,false);
	    // Opaque collision box outline
	    draw_set_alpha(1);
	    draw_rectangle_color(
	                        (floor(x)-((sprite_width-sprite_width)+(floor(x)-floor(bbox_left)))),
	                        (floor(y)-((sprite_height-sprite_height)+(floor(y)-floor(bbox_top)))),
	                        (floor(x)+((sprite_width-sprite_width)+(floor(bbox_right)-floor(x)))),
	                        (floor(y)+((sprite_height-sprite_height)+(floor(bbox_bottom)-floor(y)))),
	                        _col,_col,_col,_col,true);
	}

	// Draw origin
	//draw_sprite(spr_debug_center,0,floor(x),floor(y));
}