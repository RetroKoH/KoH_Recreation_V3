function setup_Game(){
	setup_Game_Macros();
	global.game_start = false;

	globalvar cPLAYER, cDEBUG, cRENDER, cBKG, cCAMERA, cAUDIO, cINPUT;
	cPLAYER		= noone;
	cDEBUG		= instance_create_layer(0, -64, "Core", core_Debug);	
	cRENDER		= instance_create_layer(0, -64, "Core", core_Renderer);
	cBKG		= instance_create_layer(0, -64, "Core", core_Background);
	cCAMERA		= instance_create_layer(0, -64, "Core", core_Camera);
	cAUDIO		= instance_create_layer(0, -64, "Core", core_Audio);
	cINPUT		= instance_create_layer(0, -64, "Core", core_Input);
	
	setup_Game_DebugMode();
	setup_Game_KeyMap();
	setup_Game_Screen();			// Credit to Orbinaut Framework
	setup_Game_Collision();			// Uses the same S1 Collision system. Optimized reading credited to Orbinaut Framework
	setup_Game_Animations();		// My Recreation Animation system. Execution slightly cleaned up thx to Orbinaut.
	setup_Game_OscValues();
	setup_Game_SyncAnimTimers();
	setup_Game_Audio();
	setup_Game_Shaders();			// Credit to Orbinaut Framework
	setup_Game_OptionsMenu();
	
	instance_create_layer(room_width/2, room_height/2, "Instances", obj_Splash);

	// End of setup
	random_set_seed(randomise());
	global.game_start_time = date_current_datetime();
	global.game_start = true;
}

function setup_Game_Macros(){

	// Global macros
	#macro FONT			global
	#macro SHADER		global
	#macro GAMECAM		view_camera[0]
	#macro TILE_SIZE	16
	#macro TILE_COUNT	256
	#macro LOG_TIME		180

	// Audio macros
	#macro AU_PRIMARY		0	// Primary mode used for most BGMs
	#macro AU_SECONDARY		1	// Secondary mode used for 1-Ups
	#macro AUEVENT_IDLE		0
	#macro AUEVENT_MUTE		1
	#macro AUEVENT_UNMUTE	2
	#macro AUEVENT_STOP		3

	// Palette macros. If you decide to change PAL_LIMIT, do the same with the value in ShaderMain.sfh
	#macro PAL_LIMIT		64
	#macro PAL_PRIMARY		0
	#macro PAL_SECONDARY	1

	// Fade macro
	#macro FADESTATE_ACTIVE	1
	#macro FADESTATE_MAX	2
	#macro FADEMODE_INTO	0
	#macro FADEMODE_FROM	1
	#macro FADEBLEND_BLACK	0
	#macro FADEBLEND_WHITE	1
	#macro FADEBLEND_FLASH	2
	
	// Keymap array indices
	enum KEYMAP{
		UP,
		DOWN,
		LEFT,
		RIGHT,
		BTN_A,
		BTN_B,
		BTN_C,
		START,
		MODE
	}
	
	// Player mode indices
	enum PLMODE{
		SONIC,
		TAILS,
		KNUCKLES,
		AMY,
		MIGHTY,
		RAY,
		METAL,
		TOTAL
	}

	// BGM indices
	enum BGMs {
		TITLE,
		LEV_SELECT,
		GHZ1,
		GHZ2,
		BOSS,
		ACT_CLEAR,
		INVINC,
		EXTRA_LIFE,
		TOTAL
	}
}
function setup_Game_DebugMode(){
	global.debugmode = true;	// Flag for debug UI and functions
	global.showsplash = true;	// Flag for showing splash screens
	global.debuglog = "";		// Debug messages will go here
	global.debuglog_timer = 0;	// Timer to remove the oldest message
	
	FONT.Debug = font_add_sprite(spr_MenuFont, ord("!"), false, 0);	// Font used for debug elements
	FONT.Menu = FONT.Debug;
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
	if !file_exists("settings.ini") gfunc_debug_log_add("Settings File Not Found. A new one will be created.");
	ini_open("settings.ini");
	gfunc_debug_log_add("Controls Loaded from: " + "settings.ini");
	
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
		gfunc_debug_log_add("Default Controls Initialized");
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
	global.keymap[KEYMAP.MODE]=ini_read_real("Controls", "KEY_DEBUG", vk_shift);
	gfunc_debug_log_add("Keymapping Complete");
	ini_close();
}
function setup_Game_Screen(){
	global.win_title = "Recreation Engine";
	global.win_width = 424;
	global.win_height = 240;
	global.win_size = 3;
	global.scrn_buffer = 8;
	global.win_start_full = false;		// Flag to start in fullscreen mode
	
	// To be used w/ configurable width and height values.
	if (global.win_width / 2) mod 2 or (global.win_height / 2) mod 2 != 0
		show_message("UNSUPPORTED RESOLUTION! \nHalved width or height isn't an even value. You may experience some issues because of that");

	// Update application and camera size to game resolution
	gfunc_app_set_size(global.win_width, global.win_height);
	
	// Set window properties
	var Width  = global.win_width  * global.win_size;
	var Height = global.win_height * global.win_size;	
	
	window_set_position( (display_get_width() - Width) / 2, (display_get_height() - Height) / 2 );
	window_set_size(Width, Height);
	
	window_set_fullscreen(global.win_start_full);
	window_set_caption(global.win_title);
	
	// ...and apply some GPU magic that will increase game speed!
	gpu_set_alphatestenable(true);
	gpu_set_alphatestref(0);
}
function setup_Game_Collision(){
	global.TileAngle   = [];
	global.TileHeights = [];
	global.TileWidths  = [];

	// Load Collision Data Files
	// Angles
	var file = file_bin_open("tiledata/anglemap.bin",0);
	var size = file_bin_size(file);
	if (file){
		for (var i = 0; i <= TILE_COUNT; i++) 
			global.TileAngle[i] = i < size ? (256 - file_bin_read_byte(file)) * 360 / 256 : 0;
		file_bin_close(file);
	}
	
	// Heights
	file = file_bin_open("tiledata/heightmap.bin",0);
	size = file_bin_size(file);
	if (file){
		for (var i = 0; i <= TILE_COUNT; i++)
			for (var j = 0; j < TILE_SIZE; j++) 
				global.TileHeights[i][j] = (i * TILE_SIZE < size) ? file_bin_read_byte(file) : 0;
		file_bin_close(file);
	}
	
	// Widths
	file = file_bin_open("tiledata/widthmap.bin",0);
	size = file_bin_size(file);
	if (file){
		for (var i = 0; i <= TILE_COUNT; i++)
			for (var j = 0; j < TILE_SIZE; j++) 
				global.TileWidths[i][j] = (i * TILE_SIZE < size) ? file_bin_read_byte(file) : 0;
		file_bin_close(file);
	}
}
function setup_Game_Animations(){
	global.AnimsIndex = [];	// Every script below pushes an animation into this index
	animtable_TITLESONIC();
	animtable_BADNIKS();
	animtable_RINGS();
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
function setup_Game_Audio(){
	
	// Default settings
	global.volume_bgm	= 0.5;
	global.volume_sfx	= 0.5;
	
	// Database of BGM tracks and loop data
	// All BGM tracks are OGG, with 4 seconds of audio after the end of the loop, to ensure smooth looping.
	//( FORMERLY: )
	// All BGM tracks are Stereo, signed 16-bit PCM encoded, 44100Hz WAV audio exported from Audacity.
	// Files contain 4 seconds of audio after the end of the loop, to ensure smooth looping.
	global.BGM_list = array_create(BGMs.TOTAL)
	
	global.BGM_list[BGMs.TITLE] = { // Finished
		ID			: bgm_Title,
		name		: "Title",
		loop_start	: -1,	// -1 = No loop
		loop_end	: 0
	}
	// ==================================================================================
	global.BGM_list[BGMs.LEV_SELECT] = { // Finished
		ID			: bgm_LevSel,
		name		: "Level Select",
		loop_start	: 0,
		loop_end	: 38.396
	}
	// ==================================================================================
	global.BGM_list[BGMs.GHZ1] = { // Finished
		ID			: bgm_GHZ1,
		name		: "GHZ Act 1",
		loop_start	: 14.404,
		loop_end	: 52.804
	}
	// ==================================================================================
	global.BGM_list[BGMs.GHZ2] = { // Finished
		ID			: bgm_GHZ2,
		name		: "GHZ Act 2",
		loop_start	: 14.414,
		loop_end	: 52.812
	}
	// ==================================================================================
	global.BGM_list[BGMs.BOSS] = { // Finished
		ID			: bgm_Boss,
		name		: "Boss",
		loop_start	: 00.000,
		loop_end	: 21.333
	}
	// ==================================================================================
	global.BGM_list[BGMs.ACT_CLEAR] = { // Finished
		ID			: bgm_ActClear,
		name		: "Act Clear",
		loop_start	: -1,	// -1 = No loop
		loop_end	: 0
	}
	// ==================================================================================
	global.BGM_list[BGMs.INVINC] = { // Finished
		ID			: bgm_Invinc,
		name		: "Invincibility",
		loop_start	: 0.916,
		loop_end	: 11.883
	}
	// ==================================================================================
	global.BGM_list[BGMs.EXTRA_LIFE] = { // Finished
		ID			: bgm_1up,
		name		: "1-Up Jingle",
		loop_start	: -1,	// -1 = No loop
		loop_end	: 0
	}
}
function setup_Game_Shaders(){
	// Setup fade module
	SHADER.pal_fade_step	= shader_get_uniform(sh_Fade, "u_step");
	SHADER.pal_fade_mode	= shader_get_uniform(sh_Fade, "u_mode");
	SHADER.pal_fade_color	= shader_get_uniform(sh_Fade, "u_colour");

	// Setup palette module
	SHADER.pal_bound		= shader_get_uniform(sh_Palette,		"u_bound");
	SHADER.pal_tex_size_1	= shader_get_uniform(sh_Palette,		"u_texSizeFst");
	SHADER.pal_UVs_1		= shader_get_uniform(sh_Palette,		"u_UVsFst");
	SHADER.pal_index_1		= shader_get_uniform(sh_Palette,		"u_indFst");
	SHADER.pal_tex_1		= shader_get_sampler_index(sh_Palette,	"u_texFst");
	SHADER.pal_tex_size_2	= shader_get_uniform(sh_Palette,		"u_texSizeSnd");
	SHADER.pal_UVs_2		= shader_get_uniform(sh_Palette,		"u_UVsSnd");
	SHADER.pal_index_2		= shader_get_uniform(sh_Palette,		"u_indSnd");
	SHADER.pal_tex_2		= shader_get_sampler_index(sh_Palette,	"u_texSnd");

	// Setup parallax module
	SHADER.prl_active		= shader_get_uniform(sh_Palette, "u_parallaxActive");
	SHADER.prl_pos			= shader_get_uniform(sh_Palette, "u_pos");
	SHADER.prl_width		= shader_get_uniform(sh_Palette, "u_width");
	SHADER.prl_height		= shader_get_uniform(sh_Palette, "u_height");
	SHADER.prl_scaleY		= shader_get_uniform(sh_Palette, "u_scaleY");
	SHADER.prl_offset		= shader_get_uniform(sh_Palette, "u_offset");
	SHADER.prl_inc_height	= shader_get_uniform(sh_Palette, "u_ilHeight");
	SHADER.prl_inc_step		= shader_get_uniform(sh_Palette, "u_ilStep");
	SHADER.prl_map_size		= shader_get_uniform(sh_Palette, "u_mapSize");
}
function setup_Game_OptionsMenu(){
	global.str_sections = [
		"GAMEPLAY",		// Gameplay settings
		"CONTROLS",		// Control keymapping
		"VIDEO",		// Video/Screen settings
		"AUDIO",		// Sound Test and settings
		"ANIMATIONS",	// Animation Viewer
		"TILESETS"		// Tileset (& Collision) Viewer
	]

	global.str_opt_onoff	= ["ON", "OFF"];

	global.str_opt_gameplay = [
		"PLAYER CHARACTER",		// Sonic, Tails, Knuckles, Amy, Mighty, Ray, Metal
		"SONIC ABILITIES",		// S1, S2, SCD, S3K, Mania, Ultimate
		"TAILS FLIGHT CANCEL",	// On/Off
		"AMY PLAY STYLE",		// S1, Origins, Pink Edition
		"SHIELD TYPE",			// Blue Shield, Elemental, or Both
		"STAGE TRANSITIONS",	// If on, transitions are seamless.
		"CD CAMERA",			// If on, screen scrolls horizontally at high speeds
		"CD TIMER"				// Toggles milliseconds
	]
	
	global.opt_gameplay = ds_map_create();
	global.opt_gameplay[? 0] = 0; // Player Mode
	global.opt_gameplay[? 1] = 0; // Sonic Ability
	global.opt_gameplay[? 2] = 0; // Tails Ability
	global.opt_gameplay[? 3] = 0; // Amy Ability
	global.opt_gameplay[? 4] = 0; // Shield Type
	global.opt_gameplay[? 5] = 0; // Stage Transitions
	global.opt_gameplay[? 6] = 0; // CD Camera
	global.opt_gameplay[? 7] = 0; // CD Timer

	global.str_opt_char		= ["SONIC", "TAILS", "KNUCKLES", "AMY", "MIGHTY", "RAY", "METAL SONIC"];
	global.str_opt_abil		= ["SONIC 1", "SONIC 2", "SCD", "S3&K", "MANIA", "ALL"];
	global.str_opt_amy		= ["S1", "ORIGINS", "ADVANCE"];
	global.str_opt_shld		= ["BLUE", "ELEMENTAL", "COMBINED"];

	global.str_opt_controls = [
		"UP",
		"DOWN",
		"LEFT",
		"RIGHT",
		"BUTTON A",
		"BUTTON B",
		"BUTTON C",
		"START"
	]

	global.str_opt_video = [
		"FULLSCREEN",
		"WINDOW SIZE",
		"RESOLUTION"
	]

	global.str_opt_audio = [
		"MUSIC VOLUME",
		"SOUND VOLUME",
		"AMBIENT VOLUME",
		"RING PANNING",
		"PLAY BGM",
		"PLAY SFX"
	]
}