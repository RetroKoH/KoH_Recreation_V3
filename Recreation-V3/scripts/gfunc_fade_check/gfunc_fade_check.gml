/// @function gfunc_fade_check(fade_state)
function gfunc_fade_check(_state){
	// Return false if there is no palette controller for some reason
	if !instance_exists(cPAL)
		return false;
	
	// Return check result
	switch _state
	{
		case FADESTATE_ACTIVE:
			return cPAL.fade_flag != false;
		break;
		case FADESTATE_MAX:
			return cPAL.fade_flag == FADESTATE_MAX;
		break;
	}
	return false;
}