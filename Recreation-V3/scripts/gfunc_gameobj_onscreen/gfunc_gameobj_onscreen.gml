///@function gfunc_gameobj_onscreen([_obj])
function gfunc_gameobj_onscreen(_obj=id) {
	// Return false if object does not exist
	if !instance_exists(_obj)
		return false;
	
	// Get radiuses
	var _width  = sprite_get_width(_obj.sprite_index)  div 2;
	var _height = sprite_get_height(_obj.sprite_index) div 2; 
	
	// Return
	return _obj.x >= cCAMERA.view_x - _width  and _obj.x <= cCAMERA.view_x + global.win_width  + _width 
	   and _obj.y >= cCAMERA.view_y - _height and _obj.y <= cCAMERA.view_y + global.win_height + _height;
}