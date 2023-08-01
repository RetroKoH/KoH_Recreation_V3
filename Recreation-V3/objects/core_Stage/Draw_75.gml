/// @description Object deactivation

/* This event don't happen on the very first frame so ALL the objects will be
	active for that frame, but will they all will be deactivated on the next one */
	
	// Stop ALL Game Objects...
	if !run_objects
		instance_deactivate_object(obj_GameObj);