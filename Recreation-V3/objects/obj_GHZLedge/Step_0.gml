/// @description Routines

switch(routine) {
	case 0:
	{
		routine++;
		solid_width		= 48;
		solid_height	= 48;	// Set height to max height on height map
		time			= 8;
		collapsing		= false;
	} break;
	
	case 1:
	// Check to trigger collapse
	{
		if gfunc_gameobj_act_solid(solid_width, solid_height, solid_height, x, false, true, false)
			routine++;
	} break;
	
	case 2:
	// Ledge Collapse
	{
		if (!time--) {
			gfunc_audio_sfx_play(SFXs.CRUMBLING);

			// Set how much time player can still be on the object
			time = width / 16 * 4 + height / 16 * 2;
			
			// Spawn pieces
			if (image_index == 0) {
				// Regular (Left facing)
				for (var _i = 5; _i >= 0; _i--)
				{
					for (var _j = 5; _j >= 0; _j--)
					{
						var _time	= (_i*16) / 16 * 4 + abs(height - (_j*16)) / 16 * 2;
						var _obj	= instance_create_layer(orig_x + (_i*16), orig_y + (_j*16), "Instances", obj_Fragment);
						
						_obj.sprite_index	= sprite_index;
						_obj.image_index	= image_index;
						_obj.index_x		= _i;
						_obj.index_y		= _j;
						_obj.time			= _time;
					}
				}
			}
			else {
				// Flipped (Right facing)
				for (var _i = 0; _i < 6; _i++) 
				{
					for (var _j = 5; _j >= 0; _j--) 
					{
						var _time   = abs(width - (_i*16)) / 16 * 4 + abs(height - (_j*16)) / 16 * 2;
						var _obj	= instance_create_layer(orig_x + (_i*16), orig_y + (_j*16), "Instances", obj_Fragment);

						_obj.sprite_index	= sprite_index;                  
						_obj.image_index	= image_index;
						_obj.index_x		= _i;
						_obj.index_y		= _j;
						_obj.time			= _time;
					}
				}
			}
			routine++;
			visible = false;
		}
		gfunc_gameobj_act_solid(solid_width, solid_height, solid_height, x, false, true, false);
	} break;
	
	// Destroy object
	case 3:
	{
		if !time-- {
			// Player should be airbone now
			cPLAYER.on_obj = false;
			cPLAYER.platform_id = noone;
			cPLAYER.in_air = true;
			cPLAYER.pushing = false;
			
			instance_destroy();
		}
		else
			gfunc_gameobj_act_solid(solid_width, solid_height, solid_height, x, false, true, false);
	} break;
}