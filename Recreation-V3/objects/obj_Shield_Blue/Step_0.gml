/// @description Invincibility Stars Routine

// Destroy if player is not under invincibility bonus
if !cPLAYER.invinc or cPLAYER.super
	instance_destroy();

else {
	// Offset position
	for (var _i = 0; _i < 4; _i++)
	{
		pos_offsets[_i] = gfunc_loop_value(pos_offsets[_i], 0 + _i * 6, 6 + _i * 6);
		pos_offsets[_i] += 1;
	}
	time++;
	
	if time mod 6 == 0
		frame = gfunc_wrap_value(frame+1, 4);
	
	// Follow player
	x = floor(cPLAYER.x);
	y = floor(cPLAYER.y);
}