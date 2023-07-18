/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(ord("1"))
	gfunc_audio_bgm_play(AU_PRIMARY, BGMs.TITLE);

else if keyboard_check_pressed(ord("2"))
	gfunc_audio_bgm_play(AU_PRIMARY, BGMs.LEV_SELECT);

else if keyboard_check_pressed(ord("3"))
	gfunc_audio_bgm_play(AU_PRIMARY, BGMs.GHZ1);

else if keyboard_check_pressed(ord("4"))
	gfunc_audio_bgm_play(AU_PRIMARY, BGMs.GHZ2);

else if keyboard_check_pressed(ord("5"))
	gfunc_audio_bgm_play(AU_PRIMARY, BGMs.BOSS);

else if keyboard_check_pressed(ord("6"))
	gfunc_audio_bgm_play(AU_PRIMARY, BGMs.ACT_CLEAR);

else if keyboard_check_pressed(ord("7"))
	gfunc_audio_bgm_play(AU_PRIMARY, BGMs.INVINC);

else if keyboard_check_pressed(ord("8"))
	gfunc_audio_bgm_play(AU_SECONDARY, BGMs.EXTRA_LIFE);
