/// @description Draw current animation frame

if (anim_ID != -1)
	// --- Draw main animation -----------------------------------------------------
	draw_sprite_ext(anim_sprite, floor(anim_spriteframe), floor(x), floor(y),
					anim_direction*anim_xscale, anim_yscale, anim_angle,
					c_white, 1);