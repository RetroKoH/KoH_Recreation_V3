/// @description Routine Handling

switch(routine){
	case 0:
	{
		routine++;
		solid_width = 16;
		solid_height = 32;
	}
	break;
	
	case 1:
	{
		var _sp = cPLAYER.xsp;
		var _collide = gfunc_gameobj_act_solid(solid_width, solid_height, solid_height, x, true, false, false);
		if _collide {
			if (cPLAYER.anim_ID == ANI_PLAYER.ROLL and abs(_sp) >= 4.5) {
				cPLAYER.pushing	= false;
				cPLAYER.xsp		= _sp;
				cPLAYER.x		+= _sp; //if (player.x<x) player.x+=sp; else player.x-=sp;
				cPLAYER.inertia	= cPLAYER.xsp;
				
				// Create pieces
				for (var _i = 0; _i < sprite_width div 16; _i++)
					for (var _j = 0; _j < sprite_height div 16; _j++)
					{
						var _obj = instance_create_layer(x - 8 + _i * 16, y - 24 + _j * 16, "Instances", obj_Fragment);
						_obj.sprite_index = sprite_index;
						_obj.image_index  = image_index;
						_obj.xsp = (_i ? 6 : 4) * sign(_sp);
						switch _j {
							case 0: _obj.ysp = _i ? -6 : -5; break;
							case 1: _obj.ysp = _i ? -2 : -1; break;
							case 2: _obj.ysp = _i ?  2 :  1; break;
							case 3: _obj.ysp = _i ?  6 :  5; break;
						}
						
						// Sub sprite indices
						_obj.index_x = _i;
						_obj.index_y = _j;
					}
				// Destroy the wall
				instance_destroy();
			}
		}
	}
	break;
}








