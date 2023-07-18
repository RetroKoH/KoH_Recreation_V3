/// @description Process Object Animations
// Formerly done in the End Step Event of every object

if !update_anims
	return;

// Run all instance animations
with obj_GameObj
	gfunc_anims_update();