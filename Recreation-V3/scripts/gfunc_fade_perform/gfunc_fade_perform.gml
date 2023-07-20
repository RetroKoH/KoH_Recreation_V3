/// @function gfunc_fade_perform(fade_mode, fade_blend, speed)
function gfunc_fade_perform(_mode, _blend, _speed){
    // Clamp the speed value
	_speed = clamp(floor(_speed * 36), 0, 756);
	
	// If speed is set to 0, perform instant fade
    var _instant = _speed == 0;
	
	// Perform fade
    if _instant or !(cPALETTE.fade_value mod 756)
    {
        cPALETTE.fade_value = _instant xor _mode ? 0 : 756; 
        cPALETTE.fade_mode = _mode; 
    }
    cPALETTE.fade_blend = _blend;
    cPALETTE.fade_speed = _speed;
}