/// @description Init Spiked Log
event_inherited();
gfunc_gameobj_OOB_set(OOB_PAUSE);
gfunc_gameobj_priority_set(3);

can_harm = false;
helix_frame = 0;
solid_width = 0;
solid_height = 0;
on_obj = false;
pushed = false;

/* Variable Definitions	
	1. length,		default = 6
	*/

debug_name	= "Spiked Log Helix";	// Name displayed when being observed