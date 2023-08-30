/// @function setup_Stage(zoneID, actID, waterFlag, waterLevel, BGM, boundL, boundT, boundR, boundB, PlayerX, PlayerY)
function setup_Stage(_zone, _act, _waterFlag, _waterLevel, _BGM, _left, _top, _right, _bottom, _playerX, _playerY){
	// Set up layer IDs
	var layer_id = layer_get_id("Collision_A");
	global.map_id[0] = layer_tilemap_get_id(layer_id);
	layer_id = layer_get_id("Collision_B");
	global.map_id[1] = layer_tilemap_get_id(layer_id);
	global.spr_id = layer_get_id("Animations");
	layer_id = layer_get_id("Foreground");
	global.chunks_id = layer_tilemap_get_id(layer_id);
	
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

	setup_LvlLayout(_zone);		// Setup layout Level

	// In the future, load object index from array of obj_Players
	cPLAYER = instance_create_layer(_playerX, _playerY, "Instances", obj_Tails);
}