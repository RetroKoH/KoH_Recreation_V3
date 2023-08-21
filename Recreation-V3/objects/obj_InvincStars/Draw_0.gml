/// @description Custom Drawing Command

for (var _i = 0; _i < 4; _i++)
{
	var _offset	= max(0, pos_offsets[_i] - 1);
	var _x		= ds_list_find_value(cPLAYER.pos_record_x, _offset);
	var _y		= ds_list_find_value(cPLAYER.pos_record_y, _offset);
		
	// --- Draw main animation -----------------------------------------------------
	draw_sprite_ext(anim_sprite, floor(anim_spriteframe), _x, _y,
					anim_direction*anim_xscale, anim_yscale, anim_angle,
					c_white, alphas[_i]);
}