// Reset angle towards 0 in mid-air [New subroutine more in line with Sonic 1's (From SoniC port)]
function ctrl_Player_ResetAngle(_angle){
	if _angle == 0	exit;
	
	if (_angle < 180)
		_angle = max(_angle - 4, 0);
	else
		_angle = gfunc_wrap_angle(min(_angle + 4, 360));
	
	col_angle = _angle; // Set Angle
}