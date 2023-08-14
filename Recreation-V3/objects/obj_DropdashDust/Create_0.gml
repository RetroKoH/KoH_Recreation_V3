/// @description Init Dash Dust

event_inherited();

gfunc_gameobj_priority_set(1);
gfunc_gameobj_OOB_set(OOB_PLAYER);	// Player objects don't get deactivated

debug_name = "Drop Dash Dust";	// Name displayed when being observed