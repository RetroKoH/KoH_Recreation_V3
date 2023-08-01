/// @function gfunc_gameobj_priority_set(val)
function gfunc_gameobj_priority_set(_val){
	depth = layer_get_depth("Instances") + _val;
	depth_default = depth;
}