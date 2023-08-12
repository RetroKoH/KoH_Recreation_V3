function ctrl_Player_SlopeResist(_rolling){
	var _sine =  global.angle_data[angle].sine;

	/*	gsp-=.078125*a;	// if rolling uphill
		gsp-=.3125*a;	// if rolling downhill*/
	if _rolling
		inertia -= (sign(inertia) == sign(_sine)) ? .078125 * _sine : .3125 * _sine;	// Rolling
	
	else
		if inertia != 0
			inertia -= (.125 * _sine);	// Standard
}