/// @description Cycling Palette Updates

switch room
{
	case stage_GHZ1:
	case stage_GHZ2:
		gfunc_palette_handle_range(PAL_PRIMARY, 37, 40, 4, 1, 6);
	break;
	
	default:
	break;
}