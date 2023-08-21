function gfunc_platform_move() {
	switch(type) {
		case 0: // Stationary
		default:
		break;

		case 1: // Horizontal (Right > Left)
			x = orig_x + (angle - $40);
			angle = global.osc[6].value;
		break;

		case 4: // Horizontal (Left > Right)
			x = orig_x + (-angle + $40);
			angle = global.osc[6].value;
		break;

		case 2: // Vertical (Down > Up)
			y_base = orig_y + (angle - $40);
			angle = global.osc[6].value;
		break;

		case 5: // Vertical (Up > Down)
			y_base = orig_y + (-angle + $40);
			angle = global.osc[6].value;
		break;

		case 3: // Set to fall if landed on
			if !time {
				if y_sink > 0 //y_sink == 4
					time = 30;
			}
			else {
				time--;
				if !time {
					time	= 32;
					falling	= true;
				}
			}
		break;
	}
}