/// @description Init player

event_inherited();

// Player variables
inertia					= 0;			// Inertia for movement physics
height					= 0;			// Tile collision height
width					= 0;			// Tile collision width
width_push				= 0;
height_def				= HEIGHT_MAIN;	// Default Tile collision height

// Status Variables (NO LONGER A BITFIELD)
flipped					= false;	// if true, facing left.
in_air					= false;	// if true, in the air.
spinning				= false;	// if true, spinning in a ball.
on_obj					= false;	// if true, not grounded, but should not fall.
roll_jump				= false;	// if true, control is locked
pushing					= false;	// if true, pushing against something
in_water				= false;	// if true, underwater.

platform_id				= noone;

// Collision related
path					= LAYER_A;					// Collision has two paths
angle					= 0;						// The angle at which you are moving. (0-$100*) < 360 degrees divided by 256.
angle_data				= global.angle_data[angle];	// Poll the current angle on each frame.

// Control Restriction Variables
move_lock				= 0;
convex					= false;
forced_roll				= false;

jump					= false;
double_jump_flag		= false;
double_jump_property	= 0;
spindash_rev			= -1;
spindash_pitch			= 1;
peelout_timer			= -1;

super					= false;	// Super transformation flag
shield					= 0;		// 0-None, 1-Blue, 2-Flame, 3-Electric, 4-Bubble
invuln					= 0;		// Invulnerability frames
invinc					= 0;		// Invincinbility timer
speed_up				= 0;		// Speed Shoes timer

my_shield				= noone;	// Designated slot for Shield object
my_stars				= noone;	// Designated slot for Stars object

gfunc_player_set_speed();
jmp_spd					= 6.5;		// Default jump velocity
control_modes			= ctrl_Sonic;
double_jump				= ctrl_Sonic_DoubleJump;
restart_timer			= 0;

touch_response_list		= ds_list_create();

// Initialise recorded position datalist
pos_record_x = ds_list_create();
pos_record_y = ds_list_create();
	
for (var _i = 0; _i < 32; _i++) 
{
	ds_list_add(pos_record_x, x);
	ds_list_add(pos_record_y, y);
}

gfunc_gameobj_priority_set(2);
gfunc_gameobj_OOB_set(OOB_PLAYER);	// Player objects don't get deactivated
gfunc_anims_init(true, global.AnimTable_PlayerSonic, 0);
debug_name				= "Player";	// Name displayed when being observed