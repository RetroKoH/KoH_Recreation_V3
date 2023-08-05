///@function gfunc_gobj_apply_speed(apply_gravity)
function gfunc_gobj_apply_speed(_gravity){
	x += xsp;
	ysp += (_gravity) ? .21875 : 0; // Apply gravity
	y += ysp;
}