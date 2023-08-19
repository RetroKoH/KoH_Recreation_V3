/// @description Init Monitor

event_inherited();

xsp				= 0;
ysp				= 0;
solid_width		= 0;
solid_height	= 0;
on_obj			= false;
pushed			= false;
path			= 0;
time			= 0;
type			= clamp(image_index-4, MONITOR.EGGMAN, MONITOR.EXTRA_LIFE);
icon			= 0;
falling			= false;
gfunc_gameobj_priority_set(3);
//gfunc_gameobj_solidbox_set(15, 15, false);
gfunc_anims_init(true, global.AnimTable_Monitors, 0);
debug_name = "Monitor"