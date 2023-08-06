function setup_Game(){
	setup_Game_Macros();
	global.game_start = false;

	globalvar cPLAYER, cINPUT;
	cPLAYER		= noone;
	cINPUT		= instance_create_layer(0, -64, "Core", core_Input);
	
	setup_Game_DebugMode();
	setup_Game_KeyMap();
	setup_Game_Collision();			// Uses the same S1 Collision system. Optimized reading credited to Orbinaut Framework
	setup_Game_Animations();		// My Recreation Animation system. Execution slightly cleaned up thx to Orbinaut.
	setup_Game_OscValues();
	setup_Game_SyncAnimTimers();
	setup_Game_GameVars();

	// End of setup
	random_set_seed(randomise());
	global.game_start_time = date_current_datetime();
	global.game_start = true;
}

function setup_Game_Macros(){

	// Global macros
	#macro TILE_SIZE	16
	#macro TILE_COUNT	256
	
	// Out-of-bounds Game Object macro
	#macro OOB_PLAYER	-1
	#macro OOB_DESTROY	0
	#macro OOB_PAUSE	1
	#macro OOB_RESET	2
	
	// Player Sizes
	#macro HEIGHT_MAIN	$13	// Standard height
	#macro HEIGHT_SHORT $F	// Tails' standing height
	#macro HEIGHT_ROLL	$E	// Rolling height
	#macro HEIGHT_GLIDE $A	// Gliding height
	#macro WIDTH_MAIN	9	// Standard Width
	#macro WIDTH_ROLL	7	// Rolling Width
	#macro WIDTH_GLIDE	$A	// Gliding Width
	
	// Collision Mode macro
	#macro COL_FLOOR	0
	#macro COL_WALL_R	1
	#macro COL_CEILING	2
	#macro COL_WALL_L	3
	
	// Keymap array indices
	enum KEYMAP{
		UP,
		DOWN,
		LEFT,
		RIGHT,
		BTN_A,
		BTN_B,
		BTN_C,
		START
	}
}
function setup_Game_DebugMode(){
	global.debugmode = false;	// Flag for debug UI and functions
	global.showsplash = true;	// Flag for showing splash screens
	global.debuglog = "";		// Debug messages will go here
	global.debuglog_timer = 0;	// Timer to remove the oldest message
}
function setup_Game_KeyMap(){
	#region KeyIndex
	{
		for(var i = 0; i < 256; i++)
			global._fhinputKeys[i] = "N/A";

		global._fhinputKeys[vk_escape] = "Escape";
		/*global._fhinputKeys[vk_f1] = "F1";
		global._fhinputKeys[vk_f2] = "F2";
		global._fhinputKeys[vk_f3] = "F3";
		global._fhinputKeys[vk_f4] = "F4";
		global._fhinputKeys[vk_f5] = "F5";
		global._fhinputKeys[vk_f6] = "F6";
		global._fhinputKeys[vk_f7] = "F7";
		global._fhinputKeys[vk_f8] = "F8";
		global._fhinputKeys[vk_f9] = "F9";
		global._fhinputKeys[vk_f10] = "F10";
		global._fhinputKeys[vk_f11] = "F11";
		global._fhinputKeys[vk_f12] = "F12";*/
		global._fhinputKeys[vk_pause] = "Pause";
		global._fhinputKeys[192] = "Tilde (~)";
		global._fhinputKeys[48] = "0";
		global._fhinputKeys[49] = "1";
		global._fhinputKeys[50] = "2";
		global._fhinputKeys[51] = "3";
		global._fhinputKeys[52] = "4";
		global._fhinputKeys[53] = "5";
		global._fhinputKeys[54] = "6";
		global._fhinputKeys[55] = "7";
		global._fhinputKeys[56] = "8";
		global._fhinputKeys[57] = "9";
		global._fhinputKeys[189] = "Dash(-)";
		global._fhinputKeys[187] = "Equals(=)";
		global._fhinputKeys[vk_backspace] = "Backspace";
		global._fhinputKeys[65] = "A";
		global._fhinputKeys[66] = "B";
		global._fhinputKeys[67] = "C";
		global._fhinputKeys[68] = "D";
		global._fhinputKeys[69] = "E";
		global._fhinputKeys[70] = "F";
		global._fhinputKeys[71] = "G";
		global._fhinputKeys[72] = "H";
		global._fhinputKeys[73] = "I";
		global._fhinputKeys[74] = "J";
		global._fhinputKeys[75] = "K";
		global._fhinputKeys[76] = "L";
		global._fhinputKeys[77] = "M";
		global._fhinputKeys[78] = "N";
		global._fhinputKeys[79] = "O";
		global._fhinputKeys[80] = "P";
		global._fhinputKeys[81] = "Q";
		global._fhinputKeys[82] = "R";
		global._fhinputKeys[83] = "S";
		global._fhinputKeys[84] = "T";
		global._fhinputKeys[85] = "U";
		global._fhinputKeys[86] = "V";
		global._fhinputKeys[87] = "W";
		global._fhinputKeys[88] = "X";
		global._fhinputKeys[89] = "Y";
		global._fhinputKeys[90] = "Z";
		global._fhinputKeys[219] = "L Bracket([)";
		global._fhinputKeys[221] = "R Bracket(])";
		global._fhinputKeys[220] = "Backslash(\\)";
		global._fhinputKeys[186] = "Semi-Colon(;)";
		global._fhinputKeys[222] = "Apostrophe(')";
		global._fhinputKeys[13] = "Enter";
		global._fhinputKeys[160] = "L Shift";
		global._fhinputKeys[161] = "R Shift";
		global._fhinputKeys[162] = "L Control";
		global._fhinputKeys[163] = "R Control";
		global._fhinputKeys[164] = "L Alt";
		global._fhinputKeys[165] = "R Alt";
		global._fhinputKeys[188] = "Comma(,)";
		global._fhinputKeys[190] = "Period(.)";
		global._fhinputKeys[191] = "Slash(/)";
		global._fhinputKeys[vk_space] = "Spacebar";
		global._fhinputKeys[93] = "Apps";
		global._fhinputKeys[vk_insert] = "Insert";
		global._fhinputKeys[vk_home] = "Home";
		global._fhinputKeys[vk_pageup] = "Page Up";
		global._fhinputKeys[vk_delete] = "Delete";
		global._fhinputKeys[vk_end] = "End";
		global._fhinputKeys[vk_pagedown] = "Page Down";
		global._fhinputKeys[144] = "Numlock";
		global._fhinputKeys[111] = "Numpad Slash(/)";
		global._fhinputKeys[106] = "Numpad Asterisk(*)";
		global._fhinputKeys[109] = "Numpad Dash(-)";
		global._fhinputKeys[vk_numpad0] = "Numpad 0";
		global._fhinputKeys[vk_numpad1] = "Numpad 1";
		global._fhinputKeys[vk_numpad2] = "Numpad 2";
		global._fhinputKeys[vk_numpad3] = "Numpad 3";
		global._fhinputKeys[vk_numpad4] = "Numpad 4";
		global._fhinputKeys[vk_numpad5] = "Numpad 5";
		global._fhinputKeys[vk_numpad6] = "Numpad 6";
		global._fhinputKeys[vk_numpad7] = "Numpad 7";
		global._fhinputKeys[vk_numpad8] = "Numpad 8";
		global._fhinputKeys[vk_numpad9] = "Numpad 9";
		global._fhinputKeys[110] = "Numpad Period(.)";
		global._fhinputKeys[107] = "Numpad Plus(+)";
		global._fhinputKeys[vk_left] = "Left Arrow";
		global._fhinputKeys[vk_right] = "Right Arrow";
		global._fhinputKeys[vk_up] = "Up Arrow";
		global._fhinputKeys[vk_down] = "Down Arrow";
	}
	#endregion

	// If the controls file doesn't exist, it'll be created automatically here
	ini_open("settings.ini");
	
	// Initialize defaults if need be.
	if !ini_section_exists("Controls")
	{
		ini_write_real("Controls", "KEY_UP",	vk_up);
		ini_write_real("Controls", "KEY_DOWN",	vk_down); 
		ini_write_real("Controls", "KEY_LEFT",	vk_left); 
		ini_write_real("Controls", "KEY_RIGHT",	vk_right); 
		ini_write_real("Controls", "KEY_A",		ord("A"));
		ini_write_real("Controls", "KEY_B",		ord("S"));
		ini_write_real("Controls", "KEY_C",		ord("D"));
		ini_write_real("Controls", "KEY_START",	vk_enter);
		ini_write_real("Controls", "KEY_DEBUG",	vk_shift);
	}

	// Keymapping (Defaults will be set if file is present but values are missing
	global.keymap[KEYMAP.UP]=ini_read_real("Controls", "KEY_UP", vk_up);
	global.keymap[KEYMAP.DOWN]=ini_read_real("Controls", "KEY_DOWN", vk_down);
	global.keymap[KEYMAP.LEFT]=ini_read_real("Controls", "KEY_LEFT", vk_left);
	global.keymap[KEYMAP.RIGHT]=ini_read_real("Controls", "KEY_RIGHT", vk_right);
	global.keymap[KEYMAP.BTN_A]=ini_read_real("Controls", "KEY_A", ord("A"));
	global.keymap[KEYMAP.BTN_B]=ini_read_real("Controls", "KEY_B", ord("S"));
	global.keymap[KEYMAP.BTN_C]=ini_read_real("Controls", "KEY_C", ord("D"));
	global.keymap[KEYMAP.START]=ini_read_real("Controls", "KEY_START", vk_enter);
	ini_close();
}
function setup_Game_Collision(){
	global.map_id		= array_create(2, -1);
	global.spr_id		= -1;
	global.chunks_id	= -1;
	global.chunks_count	= 0;
	
	global.tile_angles	= [];
	global.tile_heights = [];
	global.tile_widths  = [];
	global.angle_data	= [];

	// Load Collision Data Files
	// Angles
	var file = file_bin_open("tiledata/anglemap.bin",0);
	var size = file_bin_size(file);
	if (file){
		for (var i = 0; i <= TILE_COUNT; i++) 
			global.tile_angles[i] = i < size ? (256 - file_bin_read_byte(file)) : 0;
		file_bin_close(file);
	}
	
	// Heights
	file = file_bin_open("tiledata/heightmap.bin",0);
	size = file_bin_size(file);
	if (file){
		for (var i = 0; i <= TILE_COUNT; i++)
			for (var j = 0; j < TILE_SIZE; j++) 
				global.tile_heights[i][j] = (i * TILE_SIZE < size) ? file_bin_read_byte(file) : 0;
		file_bin_close(file);
	}
	
	// Widths
	file = file_bin_open("tiledata/widthmap.bin",0);
	size = file_bin_size(file);
	if (file){
		for (var i = 0; i <= TILE_COUNT; i++)
			for (var j = 0; j < TILE_SIZE; j++) 
				global.tile_widths[i][j] = (i * TILE_SIZE < size) ? file_bin_read_byte(file) : 0;
		file_bin_close(file);
	}
	
	// Angle Data
	var _factor = 360/256;
	for (var i = 0; i <= 256; i++) {
		var _ang = i * _factor;
		var _dat = {
			angle		: _ang,
			sine		: dsin(_ang),
			cosine		: dcos(_ang),
			quad_floor	: setup_Game_Quadrants(0, i),
			quad_wall	: setup_Game_Quadrants(1, i)
		}
		global.angle_data[i] = _dat;
	}
}
function setup_Game_Quadrants(_val, _ang){
	// WALL MODES
	if _val {
		if _ang <= 31 or _ang >= 225		// 0-44; 316-360
			return COL_FLOOR;

		else if _ang >= 32 and _ang <= 96	// 45-135
			return COL_WALL_R;

		else if _ang >= 97 and _ang <= 159	// 136-224
			return COL_CEILING;

		else if _ang >= 160 and _ang <= 224	// 225-315
			return COL_WALL_L;
	}
	
	// FLOOR MODES
	else {
		if _ang <= 32 or _ang >= 224		// 0-45; 315-360
			return COL_FLOOR;

		else if _ang >= 33 and _ang <= 95	// 46-134
			return COL_WALL_R;

		else if _ang >= 96 and _ang <= 160	// 135-225
			return COL_CEILING;

		else if _ang >= 161 and _ang <= 223	// 226-314
			return COL_WALL_L;
	}
}
function setup_Game_Animations(){
	global.AnimsIndex = [];	// Every script below pushes an animation into this index
	animtable_SONIC();
}
function setup_Game_OscValues(){
	global.osc_active = false;
}
function setup_Game_SyncAnimTimers(){
	global.sync0_time=0;	// Timer for GHZ Spiked Log
	global.sync0_frame=0;	// Frame number for GHZ Spiked Log
	global.sync1_time=0;	// Timer for Rings & Giant Rings
	global.sync1_frame=0;	// Frame number for Rings & Giant Rings
	global.sync2_time=0;	// Timer for ???
	global.sync2_frame=0;	// Frame number for ???
	global.sync3_time=0;	// Timer for Lost Rings
	global.sync3_frame=0;	// Frame number for Lost Rings
}
function setup_Game_GameVars(){
	global.p_score = 0;
	global.p_rings = 0;
	global.p_lives = 0;
	global.p_frames = 0;		// Total frame count.
	global.p_scorelife=50000;	// Amount of points needed for an extra life
	global.p_ringlife=0;		// Counter for extra lives per rings

	for (var i = 0; i < 60; i++)
		global.centiseconds[i] = floor(i / 3 * 5); //round(100*(i/60)); < Same result, except flooring instead of rounding
}

