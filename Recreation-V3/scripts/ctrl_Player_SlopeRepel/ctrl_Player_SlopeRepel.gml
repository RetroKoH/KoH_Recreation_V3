function ctrl_Player_SlopeRepel(){
	if (convex) exit; // if on a convex wheel, exit
	
	// If horizontal movement is locked, decrement timer and exit.
	if (move_lock) {
		move_lock--;
		exit;
	}
    
	// Angle check looks for non-floor angles (S1/2 Method)
	if global.angle_data[angle].quad_floor != COL_FLOOR and abs(inertia) < 2.5
	{	
		in_air		= true;
		move_lock	= 30;
		inertia		= 0;		
	}
}