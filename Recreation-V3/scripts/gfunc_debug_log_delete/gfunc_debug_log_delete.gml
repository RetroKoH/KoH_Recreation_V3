/// @function gfunc_debug_log_delete()
function gfunc_debug_log_delete(){
	if !string_count("\n", global.debuglog)
		global.debuglog="";
	else global.debuglog = string_delete(global.debuglog, 1, string_pos("\n", global.debuglog)); // Delete from char 0 to the first \n
	if global.debuglog != ""
		global.debuglog_timer = LOG_TIME;
}