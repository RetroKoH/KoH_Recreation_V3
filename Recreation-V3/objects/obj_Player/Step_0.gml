/// @description Touch Response

// Touch Response only occurs in the Main Routine
if (routine != 1)	exit;

var _obj = instance_place(x, y, obj_GameObj);
if _obj != noone {
	switch(object_get_parent(_obj.object_index)) {
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
		}
	}
}