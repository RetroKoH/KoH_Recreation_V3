function gfunc_osc_num_reset() {
	// The increment and limit values don't actually need to be reset. Polarity gets reset automatically.
	global.osc[00] = setup_Oscillation(0.5,		0,			0.0078125,	0.4921875);	// +2 - MZ & LZ
	global.osc[01] = setup_Oscillation(0.5,		0,			0.0078125,	0.609375);	// +6 - MZ & SBZ
	global.osc[02] = setup_Oscillation(0.5,		0,			0.0078125,	0.703125);	// +$A - MZ, SYZ, LZ, SLZ
	global.osc[03] = setup_Oscillation(0.5,		0,			0.0078125,	0.859375);	// +$E - GHZ, MZ, SYZ, LZ, SLZ, SBZ
	global.osc[04] = setup_Oscillation(0.5,		0,			0.015625,	0.984375);	// +$12 - MZ
	global.osc[05] = setup_Oscillation(0.5,		0,			0.03125,	0.6875);	// +$16 - MZ
	global.osc[06] = setup_Oscillation(0.5,		0,			0.03125,	2);			// +$1A - GHZ, MZ, SYZ, SLZ, SBZ
	global.osc[07] = setup_Oscillation(0.5,		0,			0.015625,	1.40625);	// +$1E - MZ, SYZ, LZ, SLZ, SBZ
	global.osc[08] = setup_Oscillation(0.5,		0,			0.0078125,	1.1171875);	// +$22 - SLZ
	global.osc[09] = setup_Oscillation(50.9375,	1.1171875,	0.0078125,	1.1171875);	// +$26 - SLZ
	global.osc[10] = setup_Oscillation(20.5,	0.703125,	0.0078125,	0.703125);	// +$2A - MZ, SYZ, LZ, SLZ
	global.osc[11] = setup_Oscillation(30.5,	1.0546875,	0.01171875,	1.0546875);	// +$2E - MZ, SYZ, LZ, SLZ
	global.osc[12] = setup_Oscillation(50.5,	1.7578125,	0.01953125,	1.7578125);	// +$32 - MZ, SYZ, LZ, SLZ
	global.osc[13] = setup_Oscillation(70.5,	2.4609375,	0.02734375,	2.4609375);	// +$36 - MZ, SYZ, LZ, SLZ
	global.osc[14] = setup_Oscillation(0.5,		0,			0.0078125,	0.4921875);	// +$3A - UNUSED ($3E is identical. Omitted)
}

function gfunc_osc_num_do() {
	// Perform oscillation on values for certain objects to use. This allows some objects
	// to move in certain ways on a timer, much like how the synchronized timers work.
	// You will notice that only certain ones work in certain zones. This is to prevent
	// unnecessary actions being run during the game, and saving time for other things.

	for (var _i = 0; _i < 15; _i++)
		gfunc_osc_num_perform(global.osc[_i]);
}

function gfunc_osc_num_perform(_osc) {
	if abs(_osc.additive) == _osc.limiter
		_osc.polarity*=-1;								// First, reverse polarity when limit is reached
	_osc.additive += _osc.increment * _osc.polarity;	// Amount to increase by, multiplied by polarity
	_osc.value += _osc.additive;						// Added to the main osc value
}