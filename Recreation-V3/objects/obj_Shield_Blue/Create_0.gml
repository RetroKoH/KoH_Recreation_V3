/// @description Init Invinc Stars

event_inherited();

// Initialise variables
pos_offsets	= [0, 6, 12, 18];
ID			= 0;
time		= 0;
frame		= 0;

gfunc_gameobj_priority_set(1);
debug_name = "Invincibility Stars";	// Name displayed when being observed