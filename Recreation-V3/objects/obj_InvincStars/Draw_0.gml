/// @description Custom Drawing Command

// Get local time
var _local_time = (time - 1) mod 6;

for (var _i = 0; _i < 4; _i++)
{
	var _offset	= max(0, pos_offsets[_i] - 1);
	var _x		= ds_list_find_value(cPLAYER.pos_record_x, _offset); //floor(cPLAYER.pos_record_x[| _offset]);
	var _y		= ds_list_find_value(cPLAYER.pos_record_y, _offset); //floor(cPLAYER.pos_record_y[| _offset]);
		
	switch _i
	{
		case 3:
		{
			if _local_time mod 3 == 0
				draw_sprite(spr_InvincStars, frame, _x, _y);
		}
		break;
		case 2:
		{
			if _local_time != 2 and _local_time < 4
				draw_sprite(spr_InvincStars, frame, _x, _y);
		}
		break;
		case 1:
		{
			if (_local_time + 1) mod 3 != 0
				draw_sprite(spr_InvincStars, frame, _x, _y);
		}
		break;
		case 0: 
		{
			draw_sprite(spr_InvincStars, frame, _x, _y); 
		}
		break;
	}
}