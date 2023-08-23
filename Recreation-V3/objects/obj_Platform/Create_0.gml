/// @description Init Platform

event_inherited();
image_speed = 0;
gfunc_gameobj_priority_set(4);

falling = false;
time	= 0;		// Used for falling platforms
y_sink	= 0;		// Used to emulate nudging the platform downward
orig_x	= x;
orig_y	= y;
prev_x	= orig_x;
y_base	= orig_y;
angle	= $80;		// Not really an angle. Used for positioning

/* Variable Definitions	
	1. Type        default = 0
	
	0 - Stationary
	1 - Horizontal (Right > Left) - Osc values
	2 - Vertical (Down > Up) - Osc values
	3 - Falls when stood upon
	4 - Horizontal (Left > Right) - Osc values
	5 - Vertical (Up > Down) - Osc values
	6 - Moves up when Switch is hit
	7 - Moves up (?)
	8 - Down > Up SLOW
	9 - Up > Down SLOW
	*/

debug_name = "Platform";