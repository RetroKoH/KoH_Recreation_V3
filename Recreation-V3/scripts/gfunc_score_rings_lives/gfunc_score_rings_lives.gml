///@function gfunc_score_add(points)
function gfunc_score_add(_points) {
	 // Set to the correct score, or the max: 9,999,999.
	global.p_score = min(global.p_score + _points, 9999999);

	if global.p_score >= global.p_scorelife
	{
	    global.p_scorelife += 50000;
		gfunc_lives_add();
	}
}

///@function gfunc_rings_add([_rings])
function gfunc_rings_add(_rings=1) {
	// Add rings, up to 999
	global.p_rings = min(global.p_rings + _rings, 999);

	if (global.p_rings >= 100 and global.p_ringlife == 0) or (global.p_rings >= 200 and global.p_ringlife == 1)
	{
		global.p_ringlife++;	// Add to the counter. Once it hits 2, no more lives for rings.
		gfunc_lives_add();
	}
}

///@function gfunc_lives_add([lives])
function gfunc_lives_add(_lives=1) {
	// Add lives, up to 999.
	global.p_lives = min(global.p_lives + _lives, 999);
	gfunc_audio_bgm_play(BGMs.EXTRA_LIFE);
}