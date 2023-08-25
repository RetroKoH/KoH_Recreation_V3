/// @description Initialise variables

// Overlay setup
HUD_enabled		= false;
HUD_offset_x	= -102; // Scrolls to 18
HUD_offset_y	= 10;
HUD_blinking	= 0;

// =========================

// Setup Title Card (Ported from Recreation Engine 2021)
tcard_routine	= TCARD_INIT;
tcard_timer		= 0;	
tcard_start_x	= array_create(4);
tcard_main_x	= array_create(4);
tcard_xpos		= array_create(4);
tcard_ypos		= array_create(4);
tcard_finished	= array_create(4, false);
tcard_zone		= global.TtlCard_ConData[core_Stage.zone_ID];

rcard_routine	= TCARD_INIT;
rcard_timer		= 0;	
rcard_start_x	= array_create(8);
rcard_main_x	= array_create(8);
rcard_xpos		= array_create(8);
rcard_ypos		= array_create(8);
rcard_finished	= array_create(8, false);
rcard_char		= global.GotCard_ConData[0];

char_name		= rcard_char.text;
zone_name		= tcard_zone.zone_name;
act_num			= core_Stage.act_ID;
act_flag		= true;	// Set to false for FINAL ZONE

// Create subsprites for the text
var _f = draw_get_font(), _a = draw_get_halign();
draw_set_font(FONT.TitleCard); draw_set_halign(fa_left);

surf_name = surface_create(string_width(zone_name),16);
surf_zone = surface_create(string_width("ZONE"),16);
surf_char = surface_create(string_width(char_name),16);
surf_pass = surface_create(string_width("PASSED"),16);
surface_set_target(surf_name);
draw_text(0,0,zone_name);
surface_reset_target();
surface_set_target(surf_zone);
draw_text(0,0,"ZONE");
surface_reset_target();
surface_set_target(surf_char);
draw_text(0,0,char_name);
surface_reset_target();
surface_set_target(surf_pass);
draw_text(0,0,"PASSED");
surface_reset_target();

draw_set_font(_f); draw_set_halign(_a);
	
cINPUT.ignore_input = true;
	
gfunc_fade_perform(FADEMODE_INTO, FADEBLEND_BLACK, 0);
cRENDER.update_anims = false;