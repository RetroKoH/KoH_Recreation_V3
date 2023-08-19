///@function ctrl_Player_Hurt(xPos, isFire, isElectricity, instantDeath, spiked)
function ctrl_Player_Hurt(_x, _fire, _electric, _death, _spiked) {
	with cPLAYER {
		// Exit if player cannot be hurt now
		if invuln or invinc							exit;
		if _fire and shield == SHIELD.FLAME			exit;
		if _electric and shield == SHIELD.LIGHTNING	exit;
	
		// Change this to an array of sounds to stop (Namely, character ability sfx)
		gfunc_audio_sfx_stop(SFXs.DROPDASH_REV);
		gfunc_audio_sfx_stop(SFXs.SPINDASH_REV);
	
		// If no rings and no shield OR instant death
		if !global.p_rings and !shield or _death
			ctrl_Player_Death(_spiked);
	
		// Handle Rings or Shield, and decrement cool bonus
		else {
			if shield {
				shield = SHIELD.NONE;
				if _spiked	gfunc_audio_sfx_play(SFXs.SPIKED);
				else		gfunc_audio_sfx_play(SFXs.HURT);
			}
			else {
				gfunc_ring_loss(min(global.p_rings, 32), x, y);	// Lose rings. (Up to 32 can be collected).
				global.p_rings = 0;								// Clear ring count
				gfunc_audio_sfx_play(SFXs.RING_LOSS);			// Play a different sound for losing rings.
			}
		
			var a=sign(x-_x);			// a is the sign of Sonic's X position minus the hazard in question's X position.
			if a=0 a=anim_direction*-1;	// If a would be 0, it defaults to 1 so that Sonic can never be flung straight upward.
		
			routine			= 2;	// Set to hurt routine
		    in_air			= true;	// Set Air status bit
		    ysp				= -4;	// The character is knocked upward.
		    xsp				= 2*a;	// The character is knocked backward.
		
			// Water Physics
			if (in_water) {
				ysp /= 2;
				xsp /= 2;
			}
		
			inertia			= 0;
			anim_ID			= ANI_PLAYER.HURT;
			invuln			= 120;

	//		if (coolbonus)
	//			coolbonus -= 1000;		// 1000 is lost for each hit.

			angle			= 0;	// Angle is set to rotate back to 0
			move_lock		= true;	// We cannot enter any input while hurt
		}
	}
}

///@function ctrl_Player_Death([spiked])
function ctrl_Player_Death(_spiked=false) {
	cCAMERA.enabled			= false;
	core_Stage.time_enabled	= false;

	with cPLAYER {
		routine			= 3;	// Player enters death routine
		// Clear Invinc status and remove stars
		// super = false
		in_air			= true;
		ysp				= -7;
		xsp				= 0;
		inertia			= 0;
		anim_ID			= ANI_PLAYER.DEATH;
		invuln			= 0;
	}

	// Cool Bonus = 0. Death removes said point bonus
	if (_spiked) gfunc_audio_sfx_play(SFXs.SPIKED);
	else gfunc_audio_sfx_play(SFXs.HURT);
}

///@function ctrl_Player_Hurt_Stop()
function ctrl_Player_Hurt_Stop() {
	ctrl_Player_CheckFloor();
	if !(in_air)
	{
		xsp = 0;
		ysp = 0;
		inertia = 0;
		anim_ID = ANI_PLAYER.WALK;
		move_lock = false;
		invuln	= 120;
		routine--;
	}
}