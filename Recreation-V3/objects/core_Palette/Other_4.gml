/// @description Update palettes and viewport

color_set	= [];
duration	= [];
swap_time	= [];
sequence	= [];

// Reset palette animation storage
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

switch(room){
	case screen_INIT:
		gfunc_palette_load(PAL_PRIMARY,   pal_SEGA);
		gfunc_palette_load(PAL_SECONDARY, noone);
	break;
	default:
		gfunc_palette_load(PAL_PRIMARY,   pal_Example_Type1);
		gfunc_palette_load(PAL_SECONDARY, pal_Example_Type2);
	break;
}