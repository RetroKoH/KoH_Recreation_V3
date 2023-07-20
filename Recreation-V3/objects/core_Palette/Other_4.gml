/// @description Palette Handler Reset
// Handler courtesy of Orbinaut Framework (Replacing my old system)

if ready exit;

// Setup executed at the start of each room
color_set	= [];
duration	= [];
swap_time	= [];
sequence	= [];
fade_value	= 756;
fade_mode	= 1;
fade_blend	= 0;
fade_speed	= 0;
fade_flag	= false;
	
// Initialise palette animation storage
for (var i = 0; i < PAL_LIMIT; i++)
{
	for (var j = 0; j < PAL_LIMIT; j++)
	{
		duration[i, j]  = noone;
		sequence[i, j]  = noone;
		swap_time[i, j] = noone;
	}	
	index_type_1[i] = 1;
	index_type_2[i] = 1;
}

ready = true;

//setup_Palette();