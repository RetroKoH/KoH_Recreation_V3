/// @description Init effect

event_inherited();					// Default animation and OOB settings
gfunc_gameobj_OOB_set(OOB_DESTROY);	// By default, objects are reset when out-of-bounds

debug_name	= "Effect";	// Name displayed when being observed