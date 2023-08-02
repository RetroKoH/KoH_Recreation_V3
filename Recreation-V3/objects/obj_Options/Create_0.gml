/// @description Init Options Menu

depth = 700;			// Set to Foreground depth
routine = 0;			// Used for exiting back to the title screen
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

// Set up layer IDs for chunk viewer
var layer_id = layer_get_id("Collision_A");
global.map_id[0] = layer_tilemap_get_id(layer_id);
layer_id = layer_get_id("Collision_B");
global.map_id[1] = layer_tilemap_get_id(layer_id);

tile_index	= 0;		// The tile being viewed
max_index	= 256;		// Make dynamic later on

_X1 = 160;			_X2 = _X1+127;
_Y1 = menu_y[1]+2;	_Y2 = _Y1+127;

view_solids		= false;	// draw solidity
view_sprites	= false;	// draw associated sprites