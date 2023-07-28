/// @function gfunc_palette_get_col(palType, color)
function gfunc_palette_get_col(_palType,_col){
	// Return first colour if no pallete set
	if cPAL.color_set[_palType] == false
		return 0;
	
	// Return colour
	if _palType == PAL_PRIMARY
		return cPAL.index_1[_col];

	else if _palType == PAL_SECONDARY
		return cPAL.index_2[_col];
}