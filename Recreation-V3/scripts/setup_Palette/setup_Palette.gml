/// @ Called in either Room Start Event or Room Creation Code.
function setup_Palette()
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
			gfunc_palette_load(PAL_PRIMARY,   pal_Example_Type1);
			gfunc_palette_load(PAL_SECONDARY, pal_Example_Type2);
		}
	}
}