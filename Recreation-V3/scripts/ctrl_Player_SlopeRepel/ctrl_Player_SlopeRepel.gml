function ctrl_Player_SlopeRepel(){
	if (convex) exit; // if on a convex wheel, exit
	
	// If horizontal movement is locked, decrement timer and exit.
	if (move_lock) {
		move_lock--;
		exit;
	}
    
	// Angle check here is different in comparison to collision mode checks
	// S3K Behavior Courtesy of Orbinaut Framework
	if angle >= $19 and angle <= $E8 and abs(inertia) < 2.5
	{
		if angle >= $31 and angle <= $D0
			in_air = true;	// If you aren't moving fast enough, fall.

		else
			inertia += (angle > $80) ? 0.5 : -0.5;

		move_lock = 30;
	}
}