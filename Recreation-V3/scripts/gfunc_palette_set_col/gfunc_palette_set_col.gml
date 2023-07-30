/// @function gfunc_palette_set_color(palType,iCol,rCol)
function gfunc_palette_set_color(palType,iCol,rCol)
{
	if cPAL.color_set[palType] == false //or !cRENDER.update_anims
		exit;
	
	// Update colour
	if palType == PAL_PRIMARY
		cPAL.index_1[iCol] = rCol;

	else if palType == PAL_SECONDARY
		cPAL.index_2[iCol] = rCol;
		
	// Reset swaptime
	if cPAL.duration[palType,iCol] != noone
		cPAL.swap_time[palType,iCol] = cPAL.duration[palType,iCol];
}

/// @function gfunc_palette_set_color_range(palType,iCol1,iCol2,rCol)
function gfunc_palette_set_color_range(palType,iCol1,iCol2,rCol)
{
	if cPAL.color_set[palType] == false //or !cRENDER.update_anims
		exit;
	
	// Update colours
	for (var i = iCol1; i <= iCol2; i++)
	{
		if palType == PAL_PRIMARY
			cPAL.index_1[i] = rCol;

		else if palType == PAL_SECONDARY
			cPAL.index_2[i] = rCol;
	}
		
	// Reset swaptime
	if cPAL.duration[palType,iCol1] != noone
		cPAL.swap_time[palType,iCol1] = cPAL.duration[palType,iCol1];
}