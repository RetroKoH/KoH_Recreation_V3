/// @function gfunc_gameobj_activate_range(x_anchor)
function gfunc_gameobj_activate_range(_x){
	instance_activate_region((_x - 128) & -128, 0, ((global.win_width + 128) & -128) + 256, room_height, true);
}