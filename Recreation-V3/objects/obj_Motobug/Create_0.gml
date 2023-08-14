/// @description Init Motobug

event_inherited();

// Object variables
routine_2	= 0;	// Secondary routine counter.
height		= 0;
width		= 0;
angle		= 0;
path		= 0;	// Collision has two paths. Motobug only uses 0.
time		= 0;	// Timer delay to start moving.
smoke_delay	= 0;	// Timer delay until motobug lets out a puff of smoke.

// Animation system related variables
gfunc_anims_init(true, global.AnimTable_Motobug, 0);
debug_name	= "Motobug";	// Name displayed when being observed