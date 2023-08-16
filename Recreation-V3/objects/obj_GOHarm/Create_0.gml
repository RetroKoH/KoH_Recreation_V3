/// @description Insert description here
// You can write your code in this editor

event_inherited();					// Default animation and OOB settings
gfunc_gameobj_OOB_set(OOB_DESTROY);	// By default, objects are reset when out-of-bounds
gfunc_gameobj_priority_set(1);		// By default, objects have a priority of 1

can_harm = true;			// Denotes that the object can harm on contact

debug_name	= "Harmful";	// Name displayed when being observed