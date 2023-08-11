/// @description Insert description here
// You can write your code in this editor

if in_air {
}

else {
	if spinning {
	}
	
	else {
		ctrl_Player_Move();
		ctrl_Player_CheckWalls();
		x_pos += xsp; y_pos += ysp;
	}
}

/*
Sonic's X is at 349.39.
	Push Sensor extends to 359.39.
Sonic's Y is at 130.
	Push Sensor is at 138.

Tile is located at cell (22,8) > (352,128)
Tile has a width of -8. (Mirrored, it's a width of 8).

At our current position, if we nudge forward, we SHOULD 