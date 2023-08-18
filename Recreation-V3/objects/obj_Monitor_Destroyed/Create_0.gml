/// @description Init Monitor Shell
event_inherited();
gfunc_gameobj_OOB_set(OOB_PAUSE);
gfunc_anims_init(true, global.AnimTable_Monitors, 0);
debug_name = "Broken Monitor";