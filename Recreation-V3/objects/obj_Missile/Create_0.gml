/// @description Init Missile

 event_inherited();

// type - declared by object that spawns it.
// 0 - Buzz Bomber. 15 frame delay w/ firing sprite, moves diagonally (Yellow).
// 1 - Crabmeat. No delay, moves in an arc, w/ gravity (Red).
// 2 - Newtron. No delay, moves horizontally (Yellow).
type = 0;
time = 0;

gfunc_gameobj_OOB_set(OOB_DESTROY);	// By default, objects are reset when out-of-bounds
gfunc_gameobj_priority_set(1);

debug_name = "Missile";	// Name displayed when being observed