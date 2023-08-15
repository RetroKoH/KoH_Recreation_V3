/// @description Init Buzz Bomber

event_inherited();

// Object variables
time		= 0;	// Timer delay
status		= 0;	// Buzz status

gfunc_gameobj_priority_set(3);
gfunc_anims_init(true, global.AnimTable_BuzzBomber, 0);
debug_name	= "Buzz Bomber";