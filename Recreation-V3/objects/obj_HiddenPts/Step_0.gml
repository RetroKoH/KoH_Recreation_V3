/// @description Routine

switch(routine){
	case 0:
	// Init
	{
		routine++;
		visible = false;
		points = 100 * power(10, image_index);	// Set points to 100, 1000, or 10000
	}
	break;

	case 1: // Invisible, waiting to be hit
	break;

	case 2:
	// After being hit
	{
		routine++;
		visible = true;
		time = 120;
		gfunc_audio_sfx_play(SFXs.HIDDEN_PTS);
		gfunc_score_add(points);
	}
	break;

	default:
	{
	    if !(--time)
			instance_destroy();
	}
	break;
}