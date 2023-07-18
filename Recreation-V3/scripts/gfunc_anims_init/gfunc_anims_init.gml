/// @function gfunc_anims_init(has_anims, table = -1, ID = -1)
function gfunc_anims_init(has_anims, table = -1, ID = -1){
	anim_flag			= has_anims;				// If true, this object has animations
	anim_table			= table;					// Animations Table
	anim_ID				= ID;						// Start with the ENTRY animation
	gfunc_anims_reset();
}

/// @function gfunc_anims_reset()
function gfunc_anims_reset(){
	if anim_flag {
		var at				= anim_table[anim_ID];
		anim_prev			= -1;						// No previous animation
		anim_sprite			= at.sprite					// Get animation sprite index
		anim_spriteframe	= 0;						// Reset sprite frame index
		anim_mask[0]		= at.mask					// Get primary sprite mask
		anim_mask[1]		= at.mask_l					// Get mirrored sprite mask
		anim_frame			= 0;						// Reset animation frame
		anim_framecount		= array_length(at.frames);	// Get number of frames in animation
		anim_looptimes		= at.loop_times				// Get # of loopbacks in animation.
		anim_loopframe		= at.loop_frame				// Get the frame for the animation to loop back to.
		anim_loopanim		= at.loop_anim				// Get the animation for the animation to loop back to.
		anim_direction		= 1;						// Direction of the animation
		anim_angle			= 0;						// Angle of the animation
		anim_xscale			= 1;						// Scale of the animation
		anim_yscale			= 1;						// Scale of the animation
		anim_speedmod		= 1;						// Speed mod factor, for running, and certain other animations.
		anim_framemod		= 0;						// General frame modifier, for certain instances such as running.
		anim_finished		= false;
		anim_reset			= true;
	}
	else {
		anim_prev			= -1;
		anim_sprite			= sprite_index
		anim_spriteframe	= 0;
		anim_mask[0]		= mask_index
		anim_mask[1]		= mask_index
		anim_frame			= 0;
		anim_framecount		= 0;
		anim_looptimes		= 0;
		anim_loopframe		= 0;
		anim_loopanim		= 0;
		anim_direction		= 1;
		anim_angle			= 0;
		anim_xscale			= 1;
		anim_yscale			= 1;
		anim_speedmod		= 1;
		anim_framemod		= 0;
		anim_finished		= false;
		anim_reset			= true;
	}
}