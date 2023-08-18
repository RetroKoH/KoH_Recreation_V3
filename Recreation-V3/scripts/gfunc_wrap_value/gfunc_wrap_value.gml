/// @function gfunc_wrap_value(value, limit)
function gfunc_wrap_value(_val, _limit){
	if (_val < 0)
        return _limit - ((-_val) mod _limit);
    return _val mod _limit;
}

/// @function gfunc_loop_value(value, lowerBound, upperBound)
function gfunc_loop_value(_val, _low, _high)
{
	// Loop the value through given boundaries
	_val = (_val - _low) % (_high - _low);
	
	// Return result
	return (_val >= 0 ? _val + _low : _high + _val);
}

/// @function gfunc_wrap_angle(_angle)
function gfunc_wrap_angle(_angle){
    if (_angle < 0)
        return $100 - ((-_angle) mod $100);
    return _angle mod $100;
}

/// @function gfunc_get_signed_angle(_angle)
function gfunc_get_signed_angle(_angle){
	_angle = gfunc_wrap_angle(_angle);
	if (_angle < $80)
		return _angle;
	return _angle - $100;
}