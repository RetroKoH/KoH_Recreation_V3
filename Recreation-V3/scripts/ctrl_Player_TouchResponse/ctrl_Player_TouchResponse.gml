///@ function ctrl_Player_TouchResponse()
function ctrl_Player_TouchResponse() {
	// Populate the Touch Response List
	var _count = instance_place_list(x, y, obj_GOInteract, touch_response_list, false);

	if _count != 0 {
		for (var _i = 0; _i < _count; _i++) {
			var _obj = ds_list_find_value(touch_response_list, 0);
			show_debug_message("Object:"+string(_obj.debug_name));
			ds_list_delete(touch_response_list, 0);

			// Get desired index to check
			var _ind = _obj.object_index == obj_Monitor ? obj_Monitor : object_get_parent(_obj.object_index);

			switch(_ind) {
				case obj_GOBadnik:
				{
					var _chk_spin	= spinning or spindash_rev != -1;
					var _chk_invinc	= super or invinc;
					var _chk_action	= false; //Player.FlightState and floor(Player.PosY) > y and Player.Ysp < 0 or Player.GlideState > GlideFall;

					// Damage enemy
					if (_chk_spin or _chk_invinc or _chk_action) and _obj.can_hit {
						// Make player bounce if they are airborne
						if in_air
						{
							// No rebound
							if y > _obj.y or ysp < 0
								ysp -= 1 * sign(ysp);	

							// Rebound
							else if ysp > 0
								ysp = -ysp;
						}
				
						// Increase player score and destroy the enemy
						var _combo = min(core_Stage.chain_combo, 3);
						if core_Stage.chain_combo >= 16
							_combo = 4;

						core_Stage.chain_combo++;
				
						switch(_combo)
						{
						    case 0: gfunc_score_add(100);	break;
						    case 1: gfunc_score_add(200);	break;
						    case 2: gfunc_score_add(500);	break;
						    case 3: gfunc_score_add(1000);	break;
							case 4: gfunc_score_add(10000);	break;
						}
				
						// Destroy badnik (Explosion!)
						with _obj {
							var _exp = instance_create_layer(x, y, "Instances", obj_Explosion);
							_exp.pts = _combo+1;
						} instance_destroy(_obj);
					}
			
					// Damage player
					else if _obj.can_harm
						ctrl_Player_Hurt(_obj.x, false, false, false, false);
				} break;

				case obj_GOHarm:
				{
					var _chk_invuln	= super or invinc or invuln;
					
					// Damage player
					if _obj.can_harm
						ctrl_Player_Hurt(_obj.x, false, false, false, false);
				} break;

				case obj_GORoutine:
				{
					_obj.routine++;
				} break;
				
				case obj_Monitor:
				{
					// Only collide with it in routine #1.
					if _obj.routine != 1
						break;
					
					if ysp >= 0 {
						if spinning {
							// Inverse player's speed
							if in_air
								ysp = -ysp;
							
							// Create explosion
							var _exp = instance_create_layer(_obj.x, _obj.y, "Instances", obj_Explosion);
							_exp.type = 1;
					
							// Temporary do not unload the object
							with _obj gfunc_gameobj_OOB_set(OOB_PLAYER);	
					
							_obj.routine++;
						}
						// Else, if not spinning, it just acts solid
					}
					else {
						// Under certain conditions, bump it and make it fall
						if y >= _obj.y+16 {
							_obj.falling = true;
							_obj.ysp = -1.5;
							ysp = -ysp;
						}
						// Otherwise, break the monitor if spinning
						else {
							if spinning {
								// Inverse player's speed
								if in_air
									ysp = -ysp;
							
								// Create explosion
								var _exp = instance_create_layer(_obj.x, _obj.y, "Instances", obj_Explosion);
								_exp.type = 1;
					
								// Temporary do not unload the object
								with _obj gfunc_gameobj_OOB_set(OOB_PLAYER);	
					
								_obj.routine++;
							}
						}
					}
				} break;
			}
		}
	}
}