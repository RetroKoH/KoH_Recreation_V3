/// @description Init Crabmeat

event_inherited();

// Object variables
routine_2	= 0;
height		= 0;
width		= 0;
angle		= 0;
path		= 0;	// Collision has two paths. Crabmeat only uses 0.
time		= 0;	// Time delay to start.
move_dir	= 0;

// Animation system related variables
gfunc_anims_init(true, global.AnimTable_Crabmeat, 0);
debug_name	= "Crabmeat";	// Name displayed when being observed