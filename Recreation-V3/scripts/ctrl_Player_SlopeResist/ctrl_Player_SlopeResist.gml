function ctrl_Player_SlopeResist(_rolling) {
	
	// Exit if on ceiling. Angles $60-$A0.
	if global.angle_data[angle].quad_floor == COL_CEILING
		return;
	
	var _sine = global.angle_data[angle].sine;

	/*	gsp-=.078125*a;	// if rolling uphill
		gsp-=.3125*a;	// if rolling downhill*/
	if _rolling
		inertia -= (sign(inertia) == sign(_sine)) ? .078125 * _sine : .3125 * _sine;	// Rolling

		if inertia != 0
			inertia -= 0.125 * _sine;	// Standard
}