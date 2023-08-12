/// @description Init player

event_inherited();

// Player variables
inertia		= 0;			// Inertia for movement physics
height		= 0;			// Tile collision height
width		= 0;			// Tile collision width
width_push	= 0;
height_def	= HEIGHT_MAIN;	// Default Tile collision height

// Status Variables (NO LONGER A BITFIELD)
flipped		= false;	// if true, facing left.
in_air		= false;	// if true, in the air.
spinning	= false;	// if true, spinning in a ball.
on_obj		= false;	// if true, not grounded, but should not fall.
// Removing roll jump lock
pushing		= false;	// if true, pushing against something
in_water	= false;	// if true, underwater.

// Collision related
path		= 0;		// Collision has two paths
angle		= 0;		// The angle at which you are moving. (0-$100*) < 360 degrees divided by 256.

// Control Restriction Variables
move_lock	= 0;
convex		= false;
forced_roll	= false;

jump					= false;
double_jump_flag		= false;
double_jump_property	= 0;
dash_flag				= false; // Variables used for Spindash, Peelout, and Drop Dash
spindash_flag			= false;
spindash_rev			= -1;
spindash_pitch			= 1;
dash_timer				= 0;

control_modes			= ctrl_Sonic;
double_jump				= -1;
gfunc_player_set_speed();
jmp_spd					= 6.5;		// Default jump velocity

gfunc_gameobj_priority_set(2);
gfunc_gameobj_OOB_set(OOB_PLAYER);	// Player objects don't get deactivated
gfunc_anims_init(true, global.AnimTable_PlayerSonic, 0);
debug_name				= "Player";	// Name displayed when being observed