function gfunc_powerup_set(_powerup) {
	switch(_powerup) {
		case MONITOR.SPEED_UP:
		case MONITOR.SUPER:	// Temporarily
		{
			cPLAYER.speed_up = $4B0;
			with(cPLAYER) gfunc_player_set_speed();
			gfunc_audio_bgm_play(BGMs.INVINC); // Change to Speed Up Music
		} break;
		
		case MONITOR.SHIELD:
		{
			with(cPLAYER) {
				shield = SHIELD.BLUE;
				if my_shield != noone instance_destroy(my_shield);
				my_shield = instance_create_layer(x, y, "Instances", obj_Shield_Blue);
				my_shield.parent = cPLAYER;
			}
			gfunc_audio_sfx_play(SFXs.SHIELD_BLU);
		} break;
		
		case MONITOR.INVINC:
		{
			if !cPLAYER.super 
				with(cPLAYER) {
					invinc = $4B0;
					if my_stars != noone instance_destroy(my_stars);
					my_stars = instance_create_layer(x, y, "Instances", obj_InvincStars);
					gfunc_audio_bgm_play(BGMs.INVINC);
				}
		} break;
		
		case MONITOR.RINGS:
		{
			gfunc_rings_add(10);
			gfunc_audio_sfx_play(SFXs.RING_S);
		} break;
		
		case MONITOR.SHIELD_F:
		{
			with(cPLAYER) {
				shield = SHIELD.FLAME;
				if my_shield != noone instance_destroy(my_shield);
				my_shield = instance_create_layer(x, y, "Instances", obj_Shield_Flame);
				my_shield.parent = cPLAYER;
			}
			gfunc_audio_sfx_play(SFXs.SHIELD_FL);
		}
		break;
		
		case MONITOR.SHIELD_L:
		{
			with(cPLAYER) {
				shield = SHIELD.LIGHTNING;
				if my_shield != noone instance_destroy(my_shield);
				my_shield = instance_create_layer(x, y, "Instances", obj_Shield_Lightning);
				my_shield.parent = cPLAYER;
			}
			gfunc_audio_sfx_play(SFXs.SHIELD_LT);
		}
		break;
		
		case MONITOR.SHIELD_B:
		{
			with(cPLAYER) {
				shield = SHIELD.BUBBLE;
				if my_shield != noone instance_destroy(my_shield);
				my_shield = instance_create_layer(x, y, "Instances", obj_Shield_Bubble);
				my_shield.parent = cPLAYER;
			}
			gfunc_audio_sfx_play(SFXs.SHIELD_BB);
		}
		break;
		
		case MONITOR.GOGGLES:
		case MONITOR.CLOCK: // Used in the new Bonus Stage
		case MONITOR.EXTRA_LIFE:
		{
			gfunc_lives_add();
		}
		break;
		
		// First index is at the very end, as it's the default case
		case MONITOR.EGGMAN:
		default:
		{
			ctrl_Player_Hurt(x, false, false, false, false);
		} break;
	}
}