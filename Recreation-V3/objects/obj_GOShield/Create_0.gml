/// @description Init Shield

event_inherited();

parent = noone;

gfunc_gameobj_priority_set(1);
// Animation system related variables
gfunc_anims_init(true, global.AnimTable_Shields, 0);
debug_name = "Shield";	// Name displayed when being observed