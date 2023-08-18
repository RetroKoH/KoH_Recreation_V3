function gfunc_gameobj_solidbox_set(_width, _height, _heightmap) {
	// Set solid radiuses
	solid_width		= _width;
	solid_height	= _height;
	solid_heightmap	= _heightmap;
	
	// Set touch and push flags
	collide_top		= false;
	collide_bottom	= false;
	collide_left	= false;
	collide_right	= false;
	collide_push	= false;
}