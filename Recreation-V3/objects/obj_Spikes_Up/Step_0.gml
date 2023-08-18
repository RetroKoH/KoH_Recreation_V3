/// @description Routine Handling

switch(routine)
{
	case 0:
	{
		routine++;
		solid_width = sprite_width div 2;
		solid_height = sprite_height div 2;
		on_obj = false;
		pushed = false;
	} break;
	
	case 1:
	{
		var _collide = gfunc_gameobj_act_solid(solid_width, solid_height, solid_height, xprevious, true, true, true);
		if _collide == spik_dir {
			ctrl_Player_Hurt(x, false, false, false, true);
		}
	} break;
}