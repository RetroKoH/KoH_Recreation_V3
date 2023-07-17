/// @ Called in either Room Start Event or Room Creation Code.
function PaletteSetup()
{
	switch room 
	{
		/*case Stage_TSZ:
		{
			palette_load(PalPrimary,   pal_tz_type1);
			palette_load(PalSecondary, pal_tz_type2);
		}
		break;*/
		default:
		{
			gfunc_palette_load(PAL_PRIMARY,   noone);
			gfunc_palette_load(PAL_SECONDARY, noone);
		}
	}
}