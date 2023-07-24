/// @description Move Camera

#region Following Target
{
	// Check if we should exit
	if enabled and instance_exists(follow) {

		// Get target's position relative to camera
		if follow == obj_Player
		{
			target_x = floor(obj_Player.x) - pos_x;
			target_y = floor(obj_Player.y) - pos_y;
		}
		else
		{
			target_x = follow.x - pos_x;
			target_y = follow.y - pos_y;
		}
	
		// Set horizontal shift speed
		if target_x <= global.win_width / 2 - 16
			shift_x = clamp(target_x - (global.win_width / 2 - 16), -shift_x_max, 0);  

		else if target_x >= global.win_width / 2
			shift_x = clamp(target_x - (global.win_width / 2), 0, shift_x_max);    

		else
			shift_x = 0;
	
		// Set vertical shift speed
		if follow == obj_Player //and cPLAYER.grounded
		{	
			//if abs(cPLAYER.inertia) >= 8
			//	var _limit = shift_y_max;
			//else
				var _limit = 6;

			shift_y = clamp(target_y - (global.win_height / 2 - 16), -_limit, _limit);
		} 
		else 
		{
			if target_y <= global.win_height / 2 - 48 
				shift_y = clamp(target_y - (global.win_height / 2 - 48), -shift_y_max, 0);  

			else if target_y >= global.win_height / 2 + 16 
				shift_y = clamp(target_y - (global.win_height / 2 + 16), 0, shift_y_max);  

			else
				shift_y = 0;
		}
	
		// Follow target
		if scroll_delay
			scroll_delay--;
		else
			pos_x += shift_x;		

		pos_y += shift_y;
	}
}
#endregion

#region Adjusting Offsets
{
	// Shake the camera. Not quite accurate to originals, but somewhat close (we hope)
	if shake_time
	{
		shake_x	= irandom_range(8, 15)    * choose(-1, 1) * (1 + shake_time / 6) / 128;
		shake_y	= irandom_range(128, 255) * choose(-1, 1) * (1 + shake_time / 6) / 255;
		shake_time--;
	}
	else
	{
		shake_x = 0;
		shake_y = 0;
	}
	
	// Check if we should exit
	if enabled and instance_exists(follow) and follow == obj_Player
	{
		// Check for overview delay
		var _shiftDown = 0;//= (obj_Player.anim_ID == PLANIM_CROUCH);
		var _shiftUp   = 0;//= (obj_Player.anim_ID == PLANIM_LOOKUP);
	
		if (_shiftUp or _shiftDown)
			if overview_delay
				overview_delay--;
	
		// Offset vertically
		if (_shiftUp or _shiftDown) and !overview_delay
		{
			if _shiftDown and offset_overview < 88 
				offset_overview += 2;

			if _shiftUp and offset_overview > -104 
				offset_overview -= 2;
		} 
		else if offset_overview != 0
			offset_overview -= 2 * sign(offset_overview);
	}
}
#endregion

#region Set Camera Position
{
	// Calculate final view position
	/*if instance_exists(Stage)
	{
		ViewX = clamp(PosX + ExtendedOffset, Stage.LeftBoundary, Stage.RightBoundary  - Game.Width);
		ViewY = clamp(PosY + OverviewOffset, Stage.TopBoundary,  Stage.BottomBoundary - Game.Height);
	}
	else*/
	{
		view_x = pos_x;
		view_y = pos_y;
	}
	//view_x += shake_x;
	//view_y += shake_y;
	
	// Update camera position
	camera_set_view_pos(GAMECAM, view_x - global.scrn_buffer, view_y);
}
#endregion