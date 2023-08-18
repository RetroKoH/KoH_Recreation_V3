/// @description Routine Handling

switch(routine)
{
	case 0:
	{
		routine++;
		solid_width = 16;
		solid_height = 8;
		on_obj = false;
		pushed = false;
	} break;
	
	case 1:
	{
		var _collide = gfunc_gameobj_act_solid(solid_width, solid_height, solid_height, xprevious, true, true, true);
		if _collide == 1 {
			routine++;
			anim_ID++;
			cPLAYER.y += 8;
			cPLAYER.ysp = -pow;
			cPLAYER.in_air = true;
			cPLAYER.on_obj = false;
			on_obj = false;
			cPLAYER.platform_id = noone;
			cPLAYER.anim_ID = ANI_PLAYER.SPRING;
			gfunc_audio_sfx_play(SFXs.SPRING);
			cPLAYER.routine=1;
		}
	} break;
	
	case 2:
	//  When animation ends, reset happens.
	{
		if anim_finished {
			anim_ID--;
			routine--;
		}
	} break;
}