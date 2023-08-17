/// @description Init Animal

event_inherited();
image_speed = 0; // We don't want an animation, so this is 0.
gfunc_gameobj_priority_set(6);

type = 0;
width = 0;
height = 0;
xsp = 0;
ysp = 0;
mov_xsp = 0;
mov_ysp = 0;
path = 0;		// Collision has two paths
frame_time = 0;

debug_name = "Animal";	// Name displayed when being observed