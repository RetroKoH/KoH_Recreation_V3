/// @description Routine Handling

switch(routine) {
	case 0:
	// Init rings
	{
		routine++;
		radius	= 8;
		time	= 256;
	} break;

	case 1:
	// Synchronized Animation/Idle
	{
		if (cPLAYER.shield == SHIELD.LIGHTNING and distance_to_object(cPLAYER) <= 64)
		{
			// Increment state
			routine = 3;
			gfunc_gameobj_priority_set(0);
		}
		
		// Sync animation of all rings
		image_index = global.sync_anim[1].frame;
	} break;

	case 3:
	// Magnetized
	{
		// If player has lost the barrier, replace the ring
		if cPLAYER.shield != SHIELD.LIGHTNING
			routine = 5;
		
		else {
			// Speed values
			var _x_vel = 0.75, _y_vel = 0.1875;
			
			// Get relative position and movement
			var _relativeX = sign(cPLAYER.x - x);
			var _relativeY = sign(cPLAYER.y - y);
			var _moveX     = (sign(xsp) == _relativeX);
			var _moveY     = (sign(ysp) == _relativeY);
			
			// Increase speed and move the ring
			xsp  += (_x_vel * _relativeX);
			ysp  += (_y_vel * _relativeY);
			gfunc_gameobj_apply_speed(false);
		}
	} break;
	
	case 5:
	// Scattered
	{
		// Move ring
		gfunc_gameobj_apply_speed(false);
		ysp  += 0.09375;
		var _dist;
		
		// Collide with floor
		if ysp >= 0
		{
			_dist = gfunc_collide_dist_floor(0, radius, COL_FLOOR)[0];
			if _dist < 0
			{
				y += _dist;
				ysp  *= -0.75;
			}
		}
		
		// Collide with ceiling
		else if ysp < 0 
		{
			_dist = gfunc_collide_dist_ceiling(0, -radius, COL_FLOOR)[0];
			if _dist < 0
			{
				y -= _dist;
				ysp *= -0.75;
			}
		}
		
		// Collide with left wall
		if xsp < 0
		{
			_dist = gfunc_collide_dist_leftwall(-radius, 0, COL_FLOOR)[0];
			if _dist < 0
			{
				x -= _dist;
				xsp *= -0.25;	// Slightly different bounce on walls, per Mercury's guide
			}
		}
		
		// Collide with right wall
		else if xsp > 0 {
			_dist = gfunc_collide_dist_leftwall(radius, 0, COL_FLOOR)[0];
			if _dist < 0
			{
				x += _dist;
				xsp *= -0.25;	// Slightly different bounce on walls, per Mercury's guide
			}
		}
		
		if !--time
			instance_destroy();  // If time hits 0, destroy the ring.
	} break;
	
	case 2:
	case 4:
	case 6:
	// Collected ring
	{
		instance_change(obj_Ring_Sparkle, true);	// Change to sparkle object
		// Change OOB setting (Maybe do this in Create event of new obj?
		// Change screen priority (Maybe do this in Create event of new obj?
		cAUDIO.ring_pan ^= 1;
		gfunc_audio_sfx_play_ring();	// Use new function to play panning ring sound
		gfunc_rings_add();				// Use new function to increment rings
	} break;
}