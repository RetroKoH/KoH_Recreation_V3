/// @description Explosion Routine
// This object only has one routine

switch(routine) {
	case 0:
	{
		routine = type + 1;
		if routine == 3 {
			sprite_index = spr_Explosion_Fire;
			sound = SFXs.BIG_EXPLOSION;
		}
	} break;
	
	case 1:
	// Badnik Explosion (Type 0)
	{
		routine++;
		var _ani = instance_create_layer(x, y, "Instances", obj_Animals);
		_ani.type = irandom(ANIMAL.ROCKY);
		if pts {
			var _pt = instance_create_layer(x, y, "Instances", obj_Points);
			_pt.pts = pts;
		}
	} break;
	
	case 2:
	// Monitor Explosion (Type 1)
	{
		routine = 4;
		gfunc_audio_sfx_play(SFXs.EXPLOSION);
	} break;
	
	case 3:
	// Boss/Bomb Explosion (Type 2)
	{
		routine = 4;
		gfunc_audio_sfx_play(SFXs.BIG_EXPLOSION);
	} break;
	
	case 4:
	// Play out animation and delete object
	{
		if image_index == 5
			instance_destroy();
	} break;
}