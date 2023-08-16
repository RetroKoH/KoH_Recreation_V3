/// @description Draw subsprites first, then draw sprite and box

draw_sprite_ext(spr_BuzzBomber_Wings, wing_frame, x, y, anim_direction, image_yscale, 0, c_white, 1);

if (xsp != 0)
	draw_sprite_ext(spr_BuzzBomber_Flame, floor(flame_frame), x, y, anim_direction, image_yscale, 0, c_white, 1);

event_inherited();