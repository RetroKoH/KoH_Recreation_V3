/// @function gfunc_debug_log_add(msg)
function gfunc_debug_log_add(msg){
	if global.debuglog != ""
		global.debuglog += "\n";

	global.debuglog_timer = LOG_TIME;
	global.debuglog += msg;
	if string_count("\n",global.debuglog) > 2
		gfunc_debug_log_delete(); // Only retain 3 most recent debug messages
	show_debug_message(msg);
}