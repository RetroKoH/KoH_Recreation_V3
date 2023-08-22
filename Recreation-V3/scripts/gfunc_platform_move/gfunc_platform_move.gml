function gfunc_platform_move() {
	switch(type) {
		case 0: // Stationary
		default:
		break;

		case 1: // Horizontal (Right > Left)
			x = orig_x + (angle - $40);
			angle = global.osc[6].value;
		break;

		case 4: // Horizontal (Left > Right) < Was type $05 in original
			x = orig_x + (-angle + $40);
			angle = global.osc[6].value;
		break;

		case 2: // Vertical (Down > Up)
			y_base = orig_y + (angle - $40);
			angle = global.osc[6].value;
		break;

		case 5: // Vertical (Up > Down) < Was type $06 in original
			y_base = orig_y + (-angle + $40);
			angle = global.osc[6].value;
		break;

		case 3: // Set to fall if landed on
			if !time {
				if on_obj
					time = 30;	// if stood on, the 30 frame timer is set.
			}
			else {
				time--;
				if !time {
					time	= 32;	// Set timer again
					falling	= true;	// Set to fall
				}
			}
		break;
	}
}