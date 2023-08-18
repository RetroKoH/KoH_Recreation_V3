///@ function ctrl_Player_TouchResponse()
function ctrl_Player_TouchResponse() {
	// Populate teh Touch Response List
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
					var _chk_spin	= cPLAYER.spinning or cPLAYER.spindash_rev != -1;
					var _chk_invinc	= false; //Player.SuperState  or Player.InvincibleBonus;
					var _chk_action	= false; //Player.FlightState and floor(Player.PosY) > y and Player.Ysp < 0 or Player.GlideState > GlideFall;

					// Damage enemy
					if _chk_spin or _chk_invinc or _chk_action {
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
					else ctrl_Player_Hurt(true, false);
				} break;
			
				case obj_GORoutine:
				{
					_obj.routine++;
				} break;
				
				/*case obj_Monitor:
				{
					// Only collide with it in routine #1.
					if _obj.routine != 1
						break;
					
					// Check if player is able to destroy it
					if ysp < 0 //and !Player.DoubleSpinAttack
						var _chk = floor(y + 16) >= _obj.y;
					
					if _chk and spinning and on_obj != _obj.id {
						// Inverse player's speed
						if in_air
							ysp = -ysp;
					
						// Create explosion
						instance_create_layer(_obj.x, _obj.y, "Instances", obj_Explosion);
						gfunc_audio_sfx_play(SFXs.EXPLOSION);
					
						// Temporary do not unload the object
						with _obj gfunc_gameobj_OOB_set(OOB_PLAYER);	
					
						_obj.routine++;
					}
					
					// If not, just collide (Add new functions and reconfigure hitboxes
					else {
						// Do collision
						gfunc_gameobj_act_solid(true, true, false, false);
					
						// Make itembox fall down
						if !falling and floor(y) >= floor(_obj.y + 16)
						{
							if object_check_overlap(TypeHitbox)
							{
								falling		= true;
								_obj.ysp	= -1.5;
								ysp			= -ysp;
							}
						}
					}
				} break;*/
			}
		}
	}
}