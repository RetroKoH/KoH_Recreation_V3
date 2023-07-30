/// @description Stage Palette Updates

switch room
{
	case stage_GHZ1:
	case stage_GHZ2:
		gfunc_palette_handle_range(PAL_PRIMARY, 11, 14, 4, 1, 8);
	break;
	
	default:
	break;
}