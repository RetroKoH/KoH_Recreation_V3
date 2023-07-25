/// @description Init Title Screen object

x = cCAMERA.view_x + global.win_width / 2;
image_speed	= 0;

routine		= 0;
wait_timer	= 0;
animated	= false;
psb			= false;

gfunc_anims_init(true, global.AnimTable_TitleSonic, 0);