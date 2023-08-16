/// @description Init Newtron

/* Variable Definitions	
	1. type,     default = 0		
	*/

event_inherited();

// Object variables
routine_2	= 0;
height		= 0;
width		= 0;
path		= 0;		// Collision has two paths. Newtron only uses 0.
has_fired	= false;

// Animation system related variables
gfunc_anims_init(true, global.AnimTable_Newtron, 0);
debug_name	= "Newtron";	// Name displayed when being observed