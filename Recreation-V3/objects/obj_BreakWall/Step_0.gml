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
				instance_destroy();
				//gfunc_gameobj_smash(8, sign(_sp));
			}
		}
	}
	break;
}








