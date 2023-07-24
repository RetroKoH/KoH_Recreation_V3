/// @description Insert description here

// Move with the camera
x = cCAMERA.view_x + global.win_width / 2;

if animated
	gfunc_anims_update();

if (floor(anim_frame) >= anim_framecount - 1)
	psb = true;