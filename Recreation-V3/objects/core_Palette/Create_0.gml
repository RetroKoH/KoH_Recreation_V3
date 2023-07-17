/// @description Palette Handler Setup
// Handler courtesy of Orbinaut Framework (Replacing my old system)
		
// Startup
color_set	= [];
duration	= [];
swap_time	= [];
sequence	= [];
fade_value	= 756;
fade_mode	= 1;
fade_blend	= 0;
fade_speed	= 0;
fade_flag	= false;
depth		= 10000; // This is used to perform Draw event earlier than Background Draw event
	
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

setup_Palette();