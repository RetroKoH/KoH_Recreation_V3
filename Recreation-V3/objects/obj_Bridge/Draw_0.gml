/// @description draw Bridge (Imported from Orbinaut Framework)

// Draw logs
for (var _i = 0; _i < length; _i++)
{   
	// Check for current log
	var _diff = abs((_i + 1) - active_piece);
	var _tension;

	// Set tension to the left
	if _i < active_piece
		_tension = _diff / active_piece;

	// Set tension to the right
	else
		_tension = _diff / (length - active_piece + 1);

	// Calculate log position
	var _logX = (x - (length / 2) * 16) + 16 * _i + 8;
	var _logY = floor(y_base + (active_depress * dsin(floor(90 * (1 - _tension)))) * global.angle_data[angle].sine);
		
	// Draw log
	draw_sprite(sprite_data[0], 0, _logX, _logY);
}