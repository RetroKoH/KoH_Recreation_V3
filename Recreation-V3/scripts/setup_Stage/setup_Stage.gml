/// @function setup_Stage(zoneID, actID, waterFlag, waterLevel, BGM, boundL, boundT, boundR, boundB)
function setup_Stage(_zone, _act, _waterFlag, _waterLevel, _BGM, _left, _top, _right, _bottom){
	if instance_exists(core_Stage)
		with (core_Stage){
			zone_ID			= _zone;
			act_ID			= _act;
			water_flag		= _waterFlag;
			water_level		= _waterLevel;
			stage_BGM		= _BGM;
			bound_left		= _left;
			bound_top		= _top;
			bound_right		= _right;
			bound_bottom	= _bottom;
		}
}