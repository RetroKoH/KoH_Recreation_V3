/// @description Init Path Swapper

/* Variable Definitions	
	1. GroundOnly,     default = false		
	2. LeftDirection,  default = "None"	
	3. RightDirection, default = "None"			
	*/

event_inherited();	// Default animation and OOB settings

gfunc_gameobj_OOB_set(OOB_PAUSE);
gfunc_gameobj_priority_set(5);

state = 0;

gfunc_gameobj_triggerbox_set(-12, 12, -32, 32);

debug_name	= "Path Swapper";	// Name displayed when being observed