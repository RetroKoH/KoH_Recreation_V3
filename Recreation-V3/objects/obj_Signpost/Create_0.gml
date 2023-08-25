/// @description Init Signpost
event_inherited();
gfunc_gameobj_OOB_set(OOB_PAUSE);
gfunc_gameobj_priority_set(5);

spintime=0;		// Time for signpost to spin.
sparkletime=0;	// Time between sparkles.
sparkleid=0;	// Counter to keep track of sparkles.

// Animation system related variables
gfunc_anims_init(true, global.AnimTable_Signpost, 0);