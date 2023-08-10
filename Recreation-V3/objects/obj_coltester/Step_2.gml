/// @description Flashing cursor

if dist < 0 {
	if osc_dir == -1 {
		alpha -= .05;
		if alpha == 0
			osc_dir = 1;
	}
	else {
		alpha += .05;
		if alpha == 1
			osc_dir = -1;
	}
}

else {
	alpha = 1;
	osc_dir = -1;
}