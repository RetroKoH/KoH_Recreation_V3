/// @description Init Ring
event_inherited();
gfunc_gameobj_OOB_set(OOB_PAUSE);

radius	= 0;		// Collision radius for lost rings.
path	= 0;
time	= 0;		// If scattered, rings expire after this timer is up.
grav	= 0.09375;	// Force of gravity applied to lost rings.

gfunc_anims_init(true, global.AnimTable_Rings, 0);
debug_name = "Ring";