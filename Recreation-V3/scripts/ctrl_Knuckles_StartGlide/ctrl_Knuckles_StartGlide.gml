function ctrl_Knuckles_StartGlide() {
	if !double_jump_flag and cINPUT.k_abc_p {
		spinning = false;
		// Disable rolling jump
		height = HEIGHT_GLIDE;
		width = WIDTH_GLIDE;
		double_jump_flag = 1;								// We are now gliding
		ysp += 2; if (ysp<0) ysp = 0;
		inertia = 4;
		glide_direction = anim_direction;					// Set initial direction of glide
		xsp = inertia*glide_direction;						// Set initial speed (not normally done here)
		double_jump_property = 180*(not anim_direction);	// Set intial glide angle
		ctrl_Player_ResetAngle(angle);						// Reset Angle
		anim_ID = ANI_PLAYER.GLIDE;							// The original engine doesn't do this, but we are.
		glide_collision_prop = 0;							// Reset Glide collision property
		glide_collision_prop |= 2;							// Set in air

		ctrl_Knuckles_SetGlideAnim();
	}
}

function ctrl_Knuckles_SetGlideAnim() {
	// We need to change this to work with double jump property instead of xsp
	if (abs(xsp) >= 4)
        anim_framemod = 0;
    if (abs(xsp) >= (4*0.32)) && (abs(xsp) < 4)
        anim_framemod = 1;
    if (abs(xsp) < (4*0.32))
        anim_framemod = 2;
}