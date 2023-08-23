///@ function gfunc_lamp_data_save(index)
function gfunc_lamp_data_save(_ind) {
	global.lamp_last		= _ind;								// Set the last lamppost
	global.lamp_xpos		= x;								// Store start position
	global.lamp_ypos		= y;
	global.lamp_rings		= global.p_rings;					// Store ring count
	global.lamp_time		= global.p_time;					// Store current time
	global.lamp_boundary	= core_Stage.target_bound_bottom;	// Store lower boundary
	global.lamp_scrx		= cCAMERA.pos_x;
	global.lamp_scry		= cCAMERA.pos_y;
}

function gfunc_lamp_data_load(){
	cPLAYER.x		= global.lamp_xpos;
	cPLAYER.y		= global.lamp_ypos;
	global.p_rings	= global.lamp_rings;
	global.p_time	= global.lamp_time;
	bound_bottom	= global.lamp_boundary;
	// Camera position set elsewhere
	
	// If restarting from death
	if global.level_restart {
		global.p_rings			= 0;
		global.p_score			= global.start_score;
	}
}

function gfunc_lamp_data_reset(){
	global.lamp_last		= 0;
	global.lamp_xpos		= 0;
	global.lamp_ypos		= 0;
	global.lamp_rings		= 0;
	global.lamp_time		= 0;
	global.lamp_boundary	= 0;
	global.lamp_scrx		= 0;
	global.lamp_scry		= 0;
}