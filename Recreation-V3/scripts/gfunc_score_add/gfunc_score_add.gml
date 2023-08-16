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

///@function gfunc_lives_add([lives])
function gfunc_lives_add(_lives=1) {
	// Add 1 life, as long as it doesn't go over 999.
	global.p_lives = min(global.p_lives + _lives, 999);
	gfunc_audio_bgm_play(BGMs.EXTRA_LIFE);
}