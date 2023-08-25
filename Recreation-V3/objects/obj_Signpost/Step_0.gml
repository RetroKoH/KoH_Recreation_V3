/// @description Routine

switch(routine)
{
	case 0: {
		routine++;
		spintime=60;
		sparkletime=12;
		sparkleid=0;
	} break;

	case 1:
	// Check if in range, and lock screen
	{
		if gfunc_gameobj_onscreen() {
			routine++;
			//if floor(Player.PosX) > (x - Game.Width * 1.5 + 64) + Game.Width / 2
			
			// Update screen boundaries
			core_Stage.target_bound_left  = x - global.win_width * 1.5 + 64;
			core_Stage.target_bound_right = x + global.win_width / 2;
		}
	} break;

	case 2: // Sign_Touch
	{
	    var _dist; _dist = cPLAYER.x - x;
	    // If main player is within 20 pixels of the signpost to the left, enter this code
	    if !(_dist<0 || _dist>=20)
	    {
	        routine++;
	        core_Stage.time_enabled = false;		// Stop timer
			core_Stage.finished		= 1;			// Level is finished
			
			// Lock screen
			core_Stage.target_bound_left = x - (global.win_width / 2);
			anim_ID++;								// Start the first animation.
			gfunc_audio_sfx_play(SFXs.SIGNPOST);
	    }
	} break;

	case 3: // Sign_Spin
	{
	    //if anim_ID == 0 anim_ID = 1;	// Start the first animation.
	    spintime--;				// Subtract 1 from the amount of time needed to spin.
	    if !spintime			// If time doesn't remain in the spin timer,
	    {
	        anim_ID++;					// Go to the next animation.
	        if anim_ID == 3 routine++;	// If we reached 3, move to the next routine.
	        else spintime=60;			// Set the next spintime for 1 second.
	    }
	    else if (spintime || anim_ID < 3)	// Otherwise, check both spin count and timer, and if they are not done, branch to the sparkles code.
	    {
	        if !--sparkletime		// If time doesn't remain in the sparkle timer,
	        {
	            sparkletime = 12;
	            var _spark = instance_create_layer(	x + global.sparkpos[sparkleid, 0],
													y + global.sparkpos[sparkleid, 1],
													"Instances", obj_Ring_Sparkle); // Create sparkle
	            if sparkleid < 7 sparkleid++;
				else sparkleid = 0; // increment sparkle counter
	        }
	    }
	} break;

	case 4: // Sign_SonicRun
	{
		routine++;
		cPLAYER.invinc = 0;
		// Shoes cleared upon hitting signpost
		global.ringbonus = global.p_rings*100;
		
		// Calculate Time Bonus
		var _time = global.p_time, _bonus = 50000;
		if (_time < 3600)		_bonus=50000;	// Under 1:00
		else if (_time < 5400)	_bonus=10000;	// Under 1:30
		else if (_time < 7200)	_bonus=5000;	// Under 2:00
		else if (_time < 9000)	_bonus=4000;	// Under 2:30
		else if (_time < 10800)	_bonus=3000;	// Under 3:00
		else if (_time < 12600)	_bonus=2000;	// Under 3:30
		else if (_time < 14400)	_bonus=1000;	// Under 4:00
		else if (_time < 18000)	_bonus=100;		// Under 5:00
		else _bonus = 0;
		
		global.timebonus = _bonus;
		
		// Cool Bonus is already determined
		
		// Play Music
		gfunc_audio_bgm_play(BGMs.ACT_CLEAR);
		core_Stage.finished = 2;
		gfunc_gameobj_OOB_set(OOB_DESTROY);
	} break;
}