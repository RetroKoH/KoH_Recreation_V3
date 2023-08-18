function setup_Game(){
	setup_Game_Macros();
	global.game_start = false;

	globalvar cPLAYER, cDEBUG, cPAL, cRENDER, cBKG, cCAMERA, cAUDIO, cINPUT;
	cPLAYER		= noone;
	cDEBUG		= instance_create_layer(0, -64, "Core", core_Debug);
	cPAL		= instance_create_layer(0, -64, "Core", core_Palette);
	cRENDER		= instance_create_layer(0, -64, "Core", core_Renderer);
	cBKG		= instance_create_layer(0, -64, "Core", core_Background);
	cCAMERA		= instance_create_layer(0, -64, "Core", core_Camera);
	cAUDIO		= instance_create_layer(0, -64, "Core", core_Audio);
	cINPUT		= instance_create_layer(0, -64, "Core", core_Input);
	
	setup_Game_DebugMode();
	setup_Game_KeyMap();
	setup_Game_Screen();			// Credit to Orbinaut Framework
	setup_Game_Collision();			// Uses the same S1 Collision system. Optimized reading credited to Orbinaut Framework
	setup_Game_Audio();
	setup_Game_Shaders();			// Credit to Orbinaut Framework
	setup_Game_OptionsMenu();		// Partial Credit to Orbinaut Framework

	setup_Game_TitleCards();
	setup_Game_Animations();		// My Recreation Animation system. Execution slightly cleaned up thx to Orbinaut.
	setup_Game_OscValues();
	setup_Game_SyncAnimTimers();
	setup_Game_ObjData_Animals();
	setup_Game_GameVars();
	
	instance_create_layer(room_width/2, room_height/2, "Instances", obj_Splash);

	// End of setup
	random_set_seed(randomise());
	global.game_start_time = date_current_datetime();
	global.game_start = true;
}

function setup_Game_Macros(){
	// Global macros
	#macro FONT				global
	#macro SHADER			global
	#macro GAMECAM			view_camera[0]
	#macro TILE_SIZE		16
	#macro TILE_COUNT		256
	#macro LOG_TIME			180

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

	// Act macro
	#macro ACT_1			0
	#macro ACT_2			1

	// Title card routine macro
	#macro TCARD_INIT		0
	#macro TCARD_ENTER		1
	#macro TCARD_WAIT		2
	#macro TCARD_FADEIN		3
	#macro TCARD_LEAVE		4
	#macro TCARD_FINISHED	5

	// Layer macro
	#macro LAYER_A			0
	#macro LAYER_B			1

	// Collision Quadrant macro
	#macro COL_FLOOR		0
	#macro COL_WALL_R		1
	#macro COL_CEILING		2
	#macro COL_WALL_L		3

	// Out-of-bounds Game Object macro
	#macro OOB_PLAYER		-1
	#macro OOB_DESTROY		0
	#macro OOB_PAUSE		1
	#macro OOB_RESET		2

	// Player Size macro
	#macro HEIGHT_MAIN $13	// Standard height
	#macro HEIGHT_SHORT $F	// Tails' standing height
	#macro HEIGHT_ROLL $E	// Rolling height
	#macro HEIGHT_GLIDE $A	// Gliding height
	#macro WIDTH_MAIN 9		// Standard Width
	#macro WIDTH_ROLL 7		// Rolling Width
	#macro WIDTH_GLIDE $A	// Gliding Width

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
	
	// Zone indices
	enum ZONE{
		GHZ,
		TOTAL
	}

	// Animal indices
	enum ANIMAL{
		FLICKY,
		RICKY,
		POCKY,
		PECKY,
		PICKY,
		CLUCKY,
		ROCKY,
		TOTAL
	}

	// Monitor indices
	enum MONITOR{
		EGGMAN,
		SPEED_UP,
		SHIELD,
		INVINC,
		RINGS,
		SUPER,
		GOGGLES,
		SHIELD_F,
		SHIELD_B,
		SHIELD_L,
		CLOCK,
		EXTRA_LIFE	// bumped from #1 to the end for easier sprite swapping
	}

	// BGM indices
	enum BGMs {
		TITLE,
		LEV_SELECT,
		GHZ1,
		GHZ2,
		BOSS,
		ACT_CLEAR,
		GAME_OVER,
		INVINC,
		EXTRA_LIFE,
		TOTAL
	}
	
	// SFX Indices
	enum SFXs {
		JUMP,				// Jumping
		HURT,				// Hurt/Death
		SKID,				// Skidding to a halt
		ROLL,				// Rolling into a ball
		SPINDASH_REV,		// Revving spindash (need to raise pitch)
		SPINDASH_REL,		// Releasing spindash/SBZ Teleporter
		PEELOUT_REV,		// Revving peelout / Metal Spindash
		PEELOUT_REL,		// Releasing Peelout
		DROPDASH_REV,		// Sonic Dropdash Revving
		DROPDASH_REL,		// Sonic Dropdash Releasing
		FLYING,				// Tails Flying
		FLY_TIRED,			// Tails Tired of Flying
		GLIDE_GRAB,			// Grabbing Walls, or Grabbing Tails
		GLIDE_LAND,			// Knuckles landing from a glide
		GLIDE_SLIDE,		// Knuckles sliding on the ground
		
		// Add Amy's sfx here
		
		HAMMER_DROP,		// Mighty's Hammer Drop
		HAMMER_THUD,		// Mighty's Hammer Drop after landing
		SHELL_DEFLECT,		// Mighty's shell deflecting projectiles
		SHELL_SPIKED,		// Mighty uncurling when hitting spikes
		RAY_DIVE,
		RAY_SWOOP,
		METAL_DASH,			// Taken from S1FEP (S1 Forever Expansion)
		SPIKED,				// Death by Spikes
		PUSH,				// Pushing blocks
		SPLASH,				// Hit water surface
		AIR_BUBBLE,			// Collect Air bubble
		UW_CHIME,			// Underwater Alert Chime
		DROWN,				// Drown underwater
		INSTASHIELD,		// Sonic's Instashield
		SHIELD_BLU,			// Blue Shield Get
		SHIELD_FL,			// Flame Shield Get
		SHIELD_FL2,			// Flame Shield Attack
//		SHIELD_FL3,			// Flame Shield Dissipated
		SHIELD_LT,			// Lightning Shield Get
		SHIELD_LT2,			// Lightning Shield Attack
		SHIELD_LT3,			// Lightning Shield Dissipate
		SHIELD_BB,			// Bubble Shield Get
		SHIELD_BB2,			// Bubble Shield Attack
		RING_R,				// Ring, panned right
		RING_L,				// Ring, panned left
		RING_S,				// Ring, in stereo
		LAMPPOST,			// Checkpoint
		LAMPPOST_MEGA,		// Mega Checkpoint (Naean)
		SPIKES_MOVE,		// Spikes moving up and down
		SPRING,				// Spring being hit
		SWITCH,				// Switch button being hit
		CRUMBLING,			// Crumbling Cliffs and Blocks
		BUMPER,				// Bumper
		EXPLOSION,			// Monitor/Badnik Explosion
		BIG_EXPLOSION,		// Boss/Bomb Explosion
		BOSS_HIT,			// Boss hit
		SIGNPOST,			// End of Act Signpost
		HIDDEN_PTS,			// Hidden Point Flag
		SCORE_TALLY,		// Cha-Ching Score Tally
		RING_LOSS,			// Scattered Rings
		GIANT_RING,			// Giant Ring
		RED_RING,			// Red Ring
		CONTINUE,			// Continue Jingle
		ACHIEVEMENT,		// Achievement Unlocked
		ERROR,				// Error sound
		TOTAL
	}
}
function setup_Game_DebugMode(){
	global.debugmode = false;	// Flag for debug UI and functions
	global.showsplash = true;	// Flag for showing splash screens
	global.debuglog = "";		// Debug messages will go here
	global.debuglog_timer = 0;	// Timer to remove the oldest message
	
	FONT.Debug		= font_add_sprite(spr_MenuFont, ord("!"), false, 0);				// Font used for debug elements
	FONT.Menu		= FONT.Debug;														// Used in Options Menu
	FONT.TitleCard	= font_add_sprite(spr_CardFont, ord("A"), true, 1);					// Used for Title Cards
	FONT.HUDNum		= font_add_sprite_ext(spr_HUDNumbers, "0123456789:';", false, 1);	// Used for HUD Timer
	FONT.LivesNum	= font_add_sprite_ext(spr_LivesNumbers, "0123456789", false, 1);	// Used for HUD Lives
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
	gfunc_debug_log_add("Keymapping Complete");
	ini_close();
}
function setup_Game_Screen(){
	global.win_title = "Recreation Engine";
	global.win_width = 424;
	global.win_height = 240;
	global.win_size = 2;
	global.scrn_buffer = 8;				// Orbinaut sets this to 8 for some reason.
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
	global.map_id		= array_create(2, -1);
	global.spr_id		= -1;
	global.chunks_id	= -1;
	global.chunks_count	= 0;
	
	global.TileAngle	= [];
	global.TileHeights	= [];
	global.TileWidths	= [];
	global.angle_data	= [];
	var _factor			= 360/256;

	// Load Collision Data Files
	// Heights
	var _file = file_bin_open("tiledata/heightmap.bin", 0);
	var _size = file_bin_size(_file);
	if (_file) {
		for (var _i = 0; _i < TILE_COUNT; _i++)
			for (var _j = 0; _j < TILE_SIZE; _j++) {
				var _byte = (_i * TILE_SIZE < _size) ? file_bin_read_byte(_file) : 0;
				if (_byte >= $80)	_byte = -($100 - _byte);
				_byte = min(abs(_byte), TILE_SIZE) * sign(_byte);
				global.tile_heights[_i][_j] = _byte;
			}
		file_bin_close(_file);
	}
	
	// Widths
	_file = file_bin_open("tiledata/widthmap.bin", 0);
	_size = file_bin_size(_file);
	if (_file) {
		for (var _i = 0; _i < TILE_COUNT; _i++)
			for (var _j = 0; _j < TILE_SIZE; _j++) {
				var _byte = (_i * TILE_SIZE < _size) ? file_bin_read_byte(_file) : 0;
				if (_byte >= $80)	_byte = -($100 - _byte);
				_byte = min(abs(_byte), TILE_SIZE) * sign(_byte);
				global.tile_widths[_i][_j] = _byte;
			}
		file_bin_close(_file);
	}

	// Angles
	_file = file_bin_open("tiledata/anglemap.bin", 0);
	_size = file_bin_size(_file);
	if (_file) {
		for (var _i = 0; _i < TILE_COUNT; _i++) {
			var _byte = _i < _size ? file_bin_read_byte(_file) : 0;
			if _byte == $FF
				global.tile_angles[_i] = 0;
			else
				global.tile_angles[_i] = $100 - _byte;
		}
		file_bin_close(_file);
	}
	
	// Angle Data
	for (var _i = 0; _i < 256; _i++) {
		var _ang = _i * _factor;
		global.angle_data[_i] = {
			angle		: _ang,
			sine		: dsin(_ang),
			cosine		: dcos(_ang),
			quad_floor	: setup_Game_AngleQuadrants(0, _i),
			quad_wall	: setup_Game_AngleQuadrants(1, _i)
		}
		show_debug_message(string(_ang)+" "+string(dsin(_ang))+" "+string(dcos(_ang)));
	}
}
function setup_Game_AngleQuadrants(_mode, _angle){
	// WALL MODES
	if _mode {
		if _angle < $20 or _angle >= $E1		// 0-44; 316-360
			return COL_FLOOR;

		else if _angle >= $20 and _angle <= $60	// 45-135
			return COL_WALL_R;

		else if _angle >= $61 and _angle <= $9F	// 136-224
			return COL_CEILING;

		else if _angle >= $A0 and _angle <= $E0	// 225-315
			return COL_WALL_L;
	}
	
	// FLOOR MODES
	else {
		if _angle <= $20 or _angle >= $E0		// 0-45; 315-360
			return COL_FLOOR;

		else if _angle >= $21 and _angle <= $5F	// 46-134
			return COL_WALL_R;

		else if _angle >= $60 and _angle <= $A0	// 135-225
			return COL_CEILING;

		else if _angle >= $A1 and _angle <= $DF	// 226-314
			return COL_WALL_L;
	}
}
function setup_Game_Audio(){
	
	// Default settings
	global.volume_bgm		= 0.5;	// Background music
	global.volume_sfx		= 0.5;	// Sound Effects
	global.volume_amb		= 0.5;	// Ambient Noise
	global.ring_panning		= true;	// Ring sounds pan left and right if true. Stereo if false.
	// Sound Test values are stored in the Options Menu object
	
	// Database of BGM tracks and loop data
	// All BGM tracks are OGG, with 4 seconds of audio after the end of the loop, to ensure smooth looping.
	//( FORMERLY: )
	// All BGM tracks are Stereo, signed 16-bit PCM encoded, 44100Hz WAV audio exported from Audacity.
	// Files contain 4 seconds of audio after the end of the loop, to ensure smooth looping.
	global.BGM_list = [];
	
	setup_Sound_BGM(bgm_Title,		"Title",			AU_PRIMARY,		-1);
	setup_Sound_BGM(bgm_LevSel,		"Level Select",		AU_PRIMARY,		0,		38.396);	// Maybe adjust loop_end
	setup_Sound_BGM(bgm_GHZ1,		"GHZ Act 1",		AU_PRIMARY,		14.404,	52.804);
	setup_Sound_BGM(bgm_GHZ2,		"GHZ Act 2",		AU_PRIMARY,		14.414,	52.812);
	setup_Sound_BGM(bgm_Boss,		"Boss",				AU_PRIMARY,		0,		21.333);
	setup_Sound_BGM(bgm_ActClear,	"Act Clear",		AU_PRIMARY,		-1);
	setup_Sound_BGM(bgm_GameOver,	"Game Over",		AU_PRIMARY,		-1);
	setup_Sound_BGM(bgm_Invinc,		"Invincibility",	AU_PRIMARY,		0.916,	11.883);
	setup_Sound_BGM(bgm_1up,		"1-Up Jingle",		AU_SECONDARY,	-1);

// This array will only be used for the Sound Test
	global.SFX_list = [];
	setup_Sound_SFX(sfx_Jump,						"Jump");
	setup_Sound_SFX(sfx_Hurt,						"Hurt");
	setup_Sound_SFX(sfx_Skid,						"Skid");
	setup_Sound_SFX(sfx_Roll,						"Roll");
	setup_Sound_SFX(sfx_SpindashRev,				"Spindash Rev");
	setup_Sound_SFX(sfx_SpindashRelease,			"Spindash Release");
	setup_Sound_SFX(sfx_PeeloutCharge,				"Peelout Charge");
	setup_Sound_SFX(sfx_PeeloutRelease,				"Peelout Release");
	setup_Sound_SFX(sfx_DropdashRev,				"Spindash Rev");
	setup_Sound_SFX(sfx_DropdashRelease,			"Spindash Release");
	setup_Sound_SFX(sfx_TailsFlying,				"Flying");
	setup_Sound_SFX(sfx_TailsFlyTired,				"Flying Tired");
	setup_Sound_SFX(sfx_Grab,						"Grabbing");
	setup_Sound_SFX(sfx_KnuxLand,					"Land From Glide");
	setup_Sound_SFX(sfx_KnuxSlide,					"Slide From Glide");
	setup_Sound_SFX(sfx_MightyDrop,					"Hammer Drop");
	setup_Sound_SFX(sfx_MightyLand,					"Hammer Drop Impact");
	setup_Sound_SFX(sfx_MightyDeflect,				"Shell Deflection");
	setup_Sound_SFX(sfx_MightyUnspin,				"Spike Uncurling");
	setup_Sound_SFX(sfx_RayDive,					"Air Glide Dive");
	setup_Sound_SFX(sfx_RaySwoop,					"Air Glide Swoop");
	setup_Sound_SFX(sfx_MetalDash,					"Metal Air Dash");
	setup_Sound_SFX(sfx_HitSpikes,					"Hurt by Spikes");
	setup_Sound_SFX(sfx_PushBlock,					"Push Blocks");
	setup_Sound_SFX(sfx_WaterSplash,				"Water Splash");
	setup_Sound_SFX(sfx_AirBubble,					"Air Bubble");
	setup_Sound_SFX(sfx_UnderwaterChime,			"Underwater Chime");
	setup_Sound_SFX(sfx_Drown,						"Drowning");
	setup_Sound_SFX(sfx_Instashield,				"Instashield");
	setup_Sound_SFX(sfx_ShieldBlue,					"Blue Shield");
	setup_Sound_SFX(sfx_ShieldFlame,				"Flame Shield");
	setup_Sound_SFX(sfx_ShieldFlameDash,			"Flame Shield Dash");
//	setup_Sound_SFX(sfx_ShieldFlameDissipate,		"Flame Shield Dissipate");
	setup_Sound_SFX(sfx_ShieldLightning,			"Lightning Shield");
	setup_Sound_SFX(sfx_ShieldLightningJump,		"Lightning Shield Jump");
	setup_Sound_SFX(sfx_ShieldLightningDissipate,	"Lightning Shield Dissipate");
	setup_Sound_SFX(sfx_ShieldBubble,				"Bubble Shield");
	setup_Sound_SFX(sfx_ShieldBubbleBounce,			"Bubble Shield Bounce");
	setup_Sound_SFX(sfx_RingRight,					"Ring (Right)");
	setup_Sound_SFX(sfx_RingLeft,					"Ring (Left)");
	setup_Sound_SFX(sfx_RingBox,					"Ring (Stereo)");
	setup_Sound_SFX(sfx_Lamppost,					"Lamppost");
	setup_Sound_SFX(sfx_LamppostMega,				"Mega Lamppost");
	setup_Sound_SFX(sfx_SpikesMove,					"Spikes Moving");
	setup_Sound_SFX(sfx_Spring,						"Spring Hit");
	setup_Sound_SFX(sfx_Switch,						"Switch Button Hit");
	setup_Sound_SFX(sfx_CrumblingLedge,				"Crumbling Ledge");
	setup_Sound_SFX(sfx_Bumper,						"Bumper");
	setup_Sound_SFX(sfx_BreakOpen,					"Small Explosion");
	setup_Sound_SFX(sfx_BigExplosion,				"Big Explosion");
	setup_Sound_SFX(sfx_BossHit,					"Boss Hit");
	setup_Sound_SFX(sfx_Signpost,					"Signpost");
	setup_Sound_SFX(sfx_HiddenPts,					"Hidden Points Flag");
	setup_Sound_SFX(sfx_EndTally,					"End-of-Level Score Tally");
	setup_Sound_SFX(sfx_RingLoss,					"Scattered Rings");
	setup_Sound_SFX(sfx_GiantRing,					"Giant Ring");
	setup_Sound_SFX(sfx_RedRing,					"Red Ring");
	setup_Sound_SFX(sfx_Continue,					"Continue Jingle");
	setup_Sound_SFX(sfx_Achievement,				"Achievement");
	setup_Sound_SFX(sfx_Error,						"Error");
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
	];

	global.str_opt_gameplay = [
		"PLAYER CHARACTER",		// Sonic, Tails, Knuckles, Amy, Mighty, Ray, Metal
		"SONIC ABILITIES",		// S1, S2, SCD, S3K, Mania, Ultimate
		"TAILS FLIGHT CANCEL",	// On/Off
		"AMY PLAY STYLE",		// S1, Origins, Pink Edition
		"SHIELD TYPE",			// Blue Shield, Elemental, or Both
		"STAGE TRANSITIONS",	// If on, transitions are seamless.
		"CD CAMERA",			// If on, screen scrolls horizontally at high speeds
		"CD TIMER"				// Toggles milliseconds
	]; global.opt_gameplay		= array_create(array_length(global.str_opt_gameplay));

	global.str_opt_char		= ["SONIC", "TAILS", "KNUCKLES", "AMY", "MIGHTY", "RAY", "METAL SONIC"];
	global.str_opt_abil		= ["SONIC 1", "SONIC 2", "SCD", "S3&K", "MANIA", "ALL"];
	global.str_opt_amy		= ["S1", "ORIGINS", "ADVANCE"];
	global.str_opt_shld		= ["BLUE", "ELEMENTAL", "COMBINED"];
	global.str_opt_onoff	= ["OFF", "ON"];

	global.str_opt_controls = [
		"UP",
		"DOWN",
		"LEFT",
		"RIGHT",
		"BUTTON A",
		"BUTTON B",
		"BUTTON C",
		"START"
	]; // Opt controls is already located above at keymap.

	global.str_opt_video = [
		"FULLSCREEN",
		"WINDOW SIZE",
		"RESOLUTION"
	];

	global.str_opt_audio = [
		"MUSIC VOLUME",
		"SOUND VOLUME",
		"AMBIENT VOLUME",
		"RING PANNING",
		"PLAY BGM",
		"PLAY SFX"
	];
}
function setup_Game_TitleCards(){
	global.TtlCard_ConData = array_create(ZONE.TOTAL);
	global.TtlCard_ItemY = [80, 100, 102, 76]; // Zone name, ZONE, Act X, Oval
	
	global.TtlCard_ConData[ZONE.GHZ] = {
		zone_name	: "GREEN HILL",
		name_mainx	:	 136,
		zone_mainx	:	 208,
		acts_mainx	:	 244,
		oval_mainx	:	 236
	}
}
function setup_Game_Animations(){
	global.AnimsIndex = [];	// Every script below pushes an animation into this index
	animtable_PLAYERS();
	animtable_TITLESONIC();
	animtable_RINGS();
	animtable_MONITORS();
	animtable_BADNIKS();
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
function setup_Game_ObjData_LostRings(){
	global.ringspeed[0]		= [-0.78,	-3.92];
	global.ringspeed[1]		= [ 0.78,	-3.92];
	global.ringspeed[2]		= [-2.22,	-3.33];
	global.ringspeed[3]		= [ 2.22,	-3.33];
	global.ringspeed[4]		= [-3.33,	-2.22];
	global.ringspeed[5]		= [ 3.33,	-2.22];
	global.ringspeed[6]		= [-3.92,	-0.78];
	global.ringspeed[7]		= [ 3.92,	-0.78];
	global.ringspeed[8]		= [-3.92,	 0.78];
	global.ringspeed[9]		= [ 3.92,	 0.78];
	global.ringspeed[10]	= [-3.33,	 2.22];
	global.ringspeed[11]	= [ 3.33,	 2.22];
	global.ringspeed[12]	= [-2.22,	 3.33];
	global.ringspeed[13]	= [ 2.22,	 3.33];
	global.ringspeed[14]	= [-0.78,	 3.92];
	global.ringspeed[15]	= [ 0.78,	 3.92];
	global.ringspeed[16]	= [-0.39,	-1.96];
	global.ringspeed[17]	= [ 0.39,	-1.96];
	global.ringspeed[18]	= [-1.11,	-1.66];
	global.ringspeed[19]	= [ 1.11,	-1.66];
	global.ringspeed[20]	= [-1.66,	-1.11];
	global.ringspeed[21]	= [ 1.66,	-1.11];
	global.ringspeed[22]	= [-1.96,	-0.39];
	global.ringspeed[23]	= [ 1.96,	-0.39];
	global.ringspeed[24]	= [-1.96,	 0.39];
	global.ringspeed[25]	= [ 1.96,	 0.39];
	global.ringspeed[26]	= [-1.66,	 1.11];
	global.ringspeed[27]	= [ 1.66,	 1.11];
	global.ringspeed[28]	= [-1.11,	 1.66];
	global.ringspeed[29]	= [ 1.11,	 1.66];
	global.ringspeed[30]	= [-0.39,	 1.96];
	global.ringspeed[31]	= [ 0.39,	 1.96];
}
function setup_Game_ObjData_Animals(){
	global.animal_sprite = array_create(ANIMAL.TOTAL);
	global.animal_xsp = array_create(ANIMAL.TOTAL);
	global.animal_ysp = array_create(ANIMAL.TOTAL);
	
	// 0 - Flicky (Bluebird)
	global.animal_sprite[ANIMAL.FLICKY] = spr_Animal_Flicky;
	global.animal_xsp[ANIMAL.FLICKY] = -3;
	global.animal_ysp[ANIMAL.FLICKY] = -4;

	// 1 - Ricky (Squirrel)
	global.animal_sprite[ANIMAL.RICKY] = spr_Animal_Ricky;
	global.animal_xsp[ANIMAL.RICKY] = -2.5;
	global.animal_ysp[ANIMAL.RICKY] = -3.5;

	// 2 - Pocky (Rabbit)
	global.animal_sprite[ANIMAL.POCKY] = spr_Animal_Pocky;
	global.animal_xsp[ANIMAL.POCKY] = -2;
	global.animal_ysp[ANIMAL.POCKY] = -4;

	// 3 - Pecky (Penguin)
	global.animal_sprite[ANIMAL.PECKY] = spr_Animal_Pecky;
	global.animal_xsp[ANIMAL.PECKY] = -1.5;
	global.animal_ysp[ANIMAL.PECKY] = -2.5;

	// 4 - Picky (Pig)
	global.animal_sprite[ANIMAL.PICKY] = spr_Animal_Picky;
	global.animal_xsp[ANIMAL.PICKY] = -1.75;
	global.animal_ysp[ANIMAL.PICKY] = -3;

	// 5 - Clucky (Chicken)
	global.animal_sprite[ANIMAL.CLUCKY] = spr_Animal_Clucky;
	global.animal_xsp[ANIMAL.CLUCKY] = -2;
	global.animal_ysp[ANIMAL.CLUCKY] = -3;

	// 6 - Rocky (Seal)
	global.animal_sprite[ANIMAL.ROCKY] = spr_Animal_Rocky;
	global.animal_xsp[ANIMAL.ROCKY] = -1.25;
	global.animal_ysp[ANIMAL.ROCKY] = -1.5;
}
function setup_Game_GameVars(){
	global.p_score		= 0;
	global.p_rings		= 0;
	global.p_lives		= 3;
	global.p_frames		= 0;		// Total frame count.
	global.p_scorelife	= 50000;	// Amount of points needed for an extra life
	global.p_ringlife	= 0;		// Counter for extra lives per rings

	for (var i = 0; i < 60; i++)
		global.centiseconds[i] = floor(i / 3 * 5); //round(100*(i/60)); < Same result, except flooring instead of rounding
}