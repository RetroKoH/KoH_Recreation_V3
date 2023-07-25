/// @function gfunc_wrap_value(value, limit)
function gfunc_wrap_value(_val, _limit){
	if (_val < 0)
        return _limit - ((-_val) % _limit);
    return _val mod _limit;
}