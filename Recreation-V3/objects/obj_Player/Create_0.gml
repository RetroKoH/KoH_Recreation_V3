/// @description Init Sonic

x_pos		= x;			// The X-coordinate of the object's centre.
y_pos		= y;			// The Y-coordinate of the object's centre.
xsp			= 0;			// The speed at which the object is moving horizontally.
ysp			= 0;			// The speed at which the object is moving vertically.
inertia		= 0;			// The speed at which the object is moving on the ground.
angle		= 0;			// The object's angle, or angle on the ground.
col_layer	= 0;

flipped		= false;
in_air		= false;
spinning	= false;

// Tile collision
width		= WIDTH_MAIN;	// The object's width from the origin pixel, left and right.
push		= WIDTH_MAIN+1;	// Object's push width. Always 10px.
height		= HEIGHT_MAIN;	// ($13) The object's height from the origin pixel, up and down.
height_def	= height;		// Default height used for transitioning to and from ball form.

topspeed	= 6;			// Maximum X speed via acceleration.
accel_run	= 0.046875;		// X-Acceleration rate.
decel_run	= 0.5;			// X-Deceleraction rate.

// Object Collision (X1, Y1, X2, Y2)
hitbox		= [floor(x - 8), floor(y - height + 3), floor(x + 8), floor(y + height - 3)]