/// @description Init Lamppost
event_inherited();
gfunc_gameobj_OOB_set(OOB_PAUSE);
gfunc_gameobj_priority_set(5);

// Animation system related variables
gfunc_anims_init(true, global.AnimTable_Lamppost, 0);