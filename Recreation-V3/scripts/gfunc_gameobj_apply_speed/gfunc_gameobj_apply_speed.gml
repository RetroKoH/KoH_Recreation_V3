///@function gfunc_gameobj_apply_speed(gravity)
function gfunc_gameobj_apply_speed(_grav){
	x	+= xsp;
	ysp	+= (_grav) ? .21875 : 0; // Sometimes, need to apply gravity
	y	+= ysp;
}