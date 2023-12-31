/// @function gfunc_anims_draw()
function gfunc_anims_draw(){
	if anim_flag {
		if (anim_ID != -1)
			// --- Draw main animation -----------------------------------------------------
			draw_sprite_ext(anim_sprite, floor(anim_spriteframe), floor(x), floor(y),
							anim_direction*anim_xscale, anim_yscale, anim_angle,
							c_white, image_alpha);

		/*if sub_anims {
			if (subanim_ID != -1)
			// --- Draw sub-animation -----------------------------------------------------
			draw_sprite_ext(subanim_sprite, floor(subanim_spriteframe), floor(x), floor(y),
				            subanim_direction*subanim_xscale, subanim_yscale, subanim_angle,
				            c_white, image_alpha);
		}*/
	}
	else
		draw_self();
}