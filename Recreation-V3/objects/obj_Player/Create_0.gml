/// @description Init Sonic

routine	= 0;	// Routine counter for Sonic

xsp		= 0;	// The speed at which the object is moving horizontally.
ysp		= 0;	// The speed at which the object is moving vertically.
inertia	= 0;	// The speed at which the object is moving on the ground.
angle	= 0;	// The object's angle, or angle on the ground.
width	= 0;	// The object's width from the origin pixel, left and right.
height	= 0;	// The object's height from the origin pixel, up and down.

gfunc_anims_init(true, global.AnimTable_PlayerSonic, ANI_PLAYER.IDLE);