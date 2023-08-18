/// @description Init Monitor

event_inherited();

/* Variable Definitions	
	1. type,     default = 0		
	*/
xsp		= 0;
ysp		= 0;
time	= 0;
icon	= 0;
falling	= false;
gfunc_gameobj_priority_set(3);
gfunc_gameobj_solidbox_set(15, 15, false);
gfunc_anims_init(true, global.AnimTable_Monitors, 0);
debug_name = "Monitor"