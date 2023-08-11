function gfunc_wrap_angle(ang){
    if (ang < 0)
        return 256 - ((-ang) mod 256);
    return ang mod 256;
}

function gfunc_wrap_value(val, limit){
	if (val < 0)
        return limit - ((-val) mod limit);
    return val mod limit;
}