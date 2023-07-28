/// @description Initialise variables

// Overlay setup
enabled = true;
offset_x = 0;
offset_y = 0;

// =========================

// Setup Title Card
card_routine	= 0;
card_timer		= 0;	
card_oval_x		= global.win_width + 28;
card_name_x		= 8;
card_zone_x		= 8;
card_act_x		= global.win_width + 22;
	
cINPUT.ignore_input = true;
	
gfunc_fade_perform(FADEMODE_INTO, FADEBLEND_BLACK, 0);
cRENDER.update_anims = false;