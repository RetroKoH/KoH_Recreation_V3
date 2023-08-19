/// @description Insert Power Icon

event_inherited();
gfunc_gameobj_OOB_set(OOB_PLAYER);	// This object doesn't despawn offscreen
image_speed=0;						// We don't want an animation, so this is 0.
gfunc_gameobj_priority_set(3);

time = 0;

debug_name = "Power Icon";