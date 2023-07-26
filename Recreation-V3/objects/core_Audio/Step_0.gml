/// @description Test Audio

if keyboard_check_pressed(ord("1"))
	gfunc_audio_bgm_play(BGMs.TITLE);

else if keyboard_check_pressed(ord("2"))
	gfunc_audio_bgm_play(BGMs.LEV_SELECT);

else if keyboard_check_pressed(ord("3"))
	gfunc_audio_bgm_play(BGMs.GHZ1);

else if keyboard_check_pressed(ord("4"))
	gfunc_audio_bgm_play(BGMs.GHZ2);

else if keyboard_check_pressed(ord("5"))
	gfunc_audio_bgm_play(BGMs.BOSS);

else if keyboard_check_pressed(ord("6"))
	gfunc_audio_bgm_play(BGMs.ACT_CLEAR);

else if keyboard_check_pressed(ord("7"))
	gfunc_audio_bgm_play(BGMs.INVINC);

else if keyboard_check_pressed(ord("8"))
	gfunc_audio_bgm_play(BGMs.EXTRA_LIFE);
