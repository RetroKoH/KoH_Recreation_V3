/// @description Routine Handling

switch(routine)
{
	case 0:
	{
		routine++;
		solid_width = 20;
		solid_height = 16;
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