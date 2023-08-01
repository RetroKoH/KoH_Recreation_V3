/// @description Set target for observation

if !global.debugmode
	exit;

var _scrX1 = bbox_left - cCAMERA.view_x, _scrX2 = bbox_right - cCAMERA.view_x;
var _scrY1 = bbox_top - cCAMERA.view_y, _scrY2 = bbox_bottom - cCAMERA.view_y;

if cDEBUG.point_x >= _scrX1 and cDEBUG.point_x <= _scrX2 {
	if cDEBUG.point_y >= _scrY1 and cDEBUG.point_y <= _scrY2 {
		cDEBUG.target		= id;
		cDEBUG.target_type	= debug_name;
	}
}