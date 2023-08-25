/// @description Init current level

// Initialise variables
boss_flag		= -1;
game_time		=  0;
time_enabled	=  0;
restart_timer	=  0;
restart_event	=  0;
finished		=  0;
paused			=  0;
can_pause		=  false;
run_objects		=  false;
level_events	=  noone;
chain_combo		=  0;

gfunc_osc_num_reset();
gfunc_anim_sync_reset();

// Set up stage
switch(room){
	case stage_GHZ1:
		setup_Stage(ZONE.GHZ, 0, false, 0, BGMs.GHZ1, 0, 0, room_width, 988, 90, 943);
		level_events = dle_GHZ1;
	break;
	case stage_GHZ2:
		setup_Stage(ZONE.GHZ, 1, false, 0, BGMs.GHZ2, 0, 0, room_width, 988, 90, 944);
	break;
}

gfunc_audio_bgm_play(stage_BGM);

// Spawn Water Surface object if there is water

// Lamppost data - Returning from lamppost or Giant Ring
if (global.lamp_last > 0) gfunc_lamp_data_load();
	
// Starting a level
else {
	global.p_time = 0;
	global.p_rings = 0;
	global.p_score = global.start_score;
		
	// Reset bonuses (Should only do on fresh level start)
	if !global.level_restart {
		global.timebonus=0;
		global.ringbonus=0;
		global.coolbonus=10000;
	}
}

// Set stage boundaries
target_bound_left	= bound_left;
target_bound_right	= bound_right;
target_bound_top	= bound_top;
target_bound_bottom	= bound_bottom;
bound_death			= bound_bottom;