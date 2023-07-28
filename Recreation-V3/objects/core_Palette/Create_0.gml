/// @description Startup

depth = 10000; // This is used to perform Draw event earlier than Background Draw event

// Initialise variables
color_set	= [];
duration	= [];
swap_time	= [];
sequence	= [];
	
fade_step	= 756;
fade_mode	= FADEMODE_FROM;
fade_blend	= FADEBLEND_BLACK;
fade_speed	= 0;
fade_flag	= false;

// Initialise palette animation storage
for (var i = 0; i < PAL_LIMIT; i++)
{
	for (var j = 0; j < PAL_LIMIT; j++)
	{
		duration[i, j] = noone;
		sequence[i, j] = noone;
		swap_time[i, j] = noone;
	}	
	index_1[i] = 1;
	index_2[i] = 1;
}

// First palette
gfunc_palette_load(PAL_PRIMARY,   pal_SEGA);
gfunc_palette_load(PAL_SECONDARY, noone);