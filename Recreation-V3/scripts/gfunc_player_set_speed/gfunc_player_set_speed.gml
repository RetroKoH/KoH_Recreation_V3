/// @function gfunc_player_set_speed()
function gfunc_player_set_speed(){
	/*if (object_index == obj01_Amy) {
		topspeed	= 5.5;		// Maximum X speed via acceleration.
		accel_run	= 0.046875;	// X-Acceleration rate.
		decel_run	= 0.5;		// X-Deceleraction rate.
	} else*/ {
		topspeed	= 6;
		accel_run	= 0.046875;
		decel_run	= 0.5;
	}
	if speed_up {
		topspeed	*= 2;
		accel_run	*= 2;
	}
	if in_water {
		topspeed	/= 2;
		accel_run	/= 2;
		decel_run	/= 2;
	}
}