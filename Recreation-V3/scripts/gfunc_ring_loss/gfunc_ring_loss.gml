///@function gfunc_ring_loss(count, x, y)
function gfunc_ring_loss(_count, _x, _y){
	var _ring = 0, _obj, _speeds;

	// Perform loop while the ring counter is less than number of lost rings
	while (_ring < _count)
	{
		// Spawn ring
		_obj			= instance_create_layer(_x, _y, "Instances", obj_Ring);
		_obj.routine	= 5;
		_speeds			= global.ringspeed[_ring];
	    _obj.xsp		= _speeds[0];
	    _obj.ysp		= _speeds[1];
		_obj.radius		= 8;
		_obj.time		= 256;
		_ring++;		// increment ring counter
	}
}