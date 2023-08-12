// Reset angle towards 0 in mid-air [New subroutine more in line with Sonic 1's (From SoniC port)]
function ctrl_Player_ResetAngle(_angle){
	if _angle == 0	exit;
	
	if (_angle < $80)
		_angle = max(_angle - 4, 0);
	else
		_angle = gfunc_wrap_angle(min(_angle + 4, $100));
	
	angle = _angle; // Set Angle
}