/// @description Handle Animations

if !update_anims
	exit;

// Process animations for all in-game objects
with obj_GameObj {
	if anim_flag
		gfunc_anims_update(sprite_override); // Add an in-object flag for sprite override
}