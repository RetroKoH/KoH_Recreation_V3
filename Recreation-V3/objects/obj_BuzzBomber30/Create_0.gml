/// @description Init Buzz Bomber

event_inherited();

// Object variables
time		= 0;	// Timer delay
status		= 0;	// Buzz status
wing_frame	= 0;	// Wings alternate every 1 frames
flame_frame = 0;	// Flames alternate every 2 frame

gfunc_gameobj_priority_set(3);
gfunc_anims_init(true, global.AnimTable_BuzzBomber, 0);
debug_name	= "Buzz Bomber";