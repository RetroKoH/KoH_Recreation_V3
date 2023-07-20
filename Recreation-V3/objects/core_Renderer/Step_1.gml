/// @description Process Object Animations
// Formerly done in the End Step Event of every object

if !update_anims
	return;

// Run all instance animations
with obj_GameObj {
	if anim_flag
		gfunc_anims_update();	// Only run animations of objects that have animations
}