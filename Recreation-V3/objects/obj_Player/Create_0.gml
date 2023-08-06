/// @description Init Sonic

routine		= 0;		// Routine counter for Sonic

// Basic variables
xsp			= 0;		// The speed at which the object is moving horizontally.
ysp			= 0;		// The speed at which the object is moving vertically.
inertia		= 0;		// The speed at which the object is moving on the ground.
angle		= 0;		// The object's angle, or angle on the ground.
width		= 0;		// The object's width from the origin pixel, left and right.
height		= 0;		// The object's height from the origin pixel, up and down.
height_def	= 0;		// The object's default height. Stored and used for position adjustment. 

// Status variables. Using booleans instead of a bitfield is faster
flipped		= false;	// If true, object is facing left.
in_air		= false;	// If true, object is in the air, not grounded.
spinning	= false;	// If true, object is in ball form.
on_obj		= false;
roll_jump	= false;
pushing		= false;
in_water	= false;

ctrl_Player_SetSpeeds();

col_layer	= 0;
move_lock	= false;
forced_roll	= false;
control		= ctrl_Sonic;
gfunc_anims_init(true, global.AnimTable_PlayerSonic, ANI_PLAYER.IDLE);