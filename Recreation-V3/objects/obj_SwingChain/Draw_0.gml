/// @description Draw Swinging Platform

// Draw origin sprite
draw_sprite(sprite_index, 0, orig_x, orig_y);
    
// Calculate chain position
for (var _i = 1; _i <= length; _i++)
{
	var _x = floor(orig_x + dist_x * _i);
	var _y = floor(orig_y + dist_y * _i);
		
	// Draw sprite
	draw_sprite(sprite_index, 1, _x, _y);
}
    
// Draw platform
//draw_sprite(sprite_data[0], 0, x, y);