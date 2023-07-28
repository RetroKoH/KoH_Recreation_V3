/// @description Init current level

setup_Stage(room);

// Initialise variables
boss_flag		= -1;
time			=  0;
time_enabled	=  0;
restart_timer	=  0;
restart_event	=  0;
finished		=  0;
paused			=  0;
run_objects		=  false;

gfunc_audio_bgm_play(stage_BGM);

// Set stage boundaries
target_bound_left	= bound_left;
target_bound_right	= bound_right;
target_bound_top	= bound_top;
target_bound_bottom	= bound_bottom;
bound_death			= bound_bottom;