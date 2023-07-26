/// @description Insert description here
// You can write your code in this editor

routine = 0;
menu = 0;				// Toggles left menu (Gameplay, Controls, Video, Audio, Anims, Tilesets
submenu = -1;			// Denotes which submenu we are in (if -1, we are in main menu)
submenu_item = -1;		// Denotes active item in the current submenu; resets to -1 when exiting a submenu.
set_control = false;	// If true, all control is disabled while a keymapping is set.

// Sound Test
sndTest_BGM = 0;
sndTest_SFX = 0;

// Y-positioning of the main menu
menu_y = []
for (var _i = 0; _i < 9; _i++){
	menu_y[_i] = 12+(18*_i);
}

// Gameplay Submenu item variables
menu_item_game = [
	global.str_opt_char,
	global.str_opt_abil,
	global.str_opt_onoff,
	global.str_opt_amy,
	global.str_opt_shld,
	global.str_opt_onoff,
	global.str_opt_onoff,
	global.str_opt_onoff
];