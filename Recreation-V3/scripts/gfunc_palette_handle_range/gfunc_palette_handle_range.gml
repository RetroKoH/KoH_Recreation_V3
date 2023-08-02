/// @function gfunc_palette_handle_range(palType,iCol1,iCol2,rCol1,rCol2,duration)
function gfunc_palette_handle_range(palType,iCol1,iCol2,rCol1,rCol2,duration){
	if cPAL.color_set[palType] == false or !cRENDER.update_anims
		exit;
	
	// Get unique ID for this palette sequence
	var SequenceID = string(rCol1) + "_" + string(rCol2);
	
	// Initialise palette sequence
	if cPAL.sequence[palType][iCol1] != SequenceID
	{
		cPAL.sequence[palType][iCol1] = SequenceID;
		cPAL.duration[palType][iCol1] = duration;
		cPAL.swap_time[palType][iCol1] = duration;
	}
	
	// Update sequence
	else if duration
	{
		if !(--cPAL.swap_time[palType,iCol1])
		{
			// Update colours
			for (var i = iCol1; i <= iCol2; i++)
			{
				if palType == PAL_PRIMARY {
					if (++cPAL.index_1[i]) > rCol1
						cPAL.index_1[i] = rCol2;
				}
				else if palType == PAL_SECONDARY {
					if (++cPAL.index_2[i]) > rCol1
						cPAL.index_2[i] = rCol2;
				}
			}
			
			// Reset duration
			cPAL.swap_time[palType,iCol1] = cPAL.duration[palType,iCol1];
		}
	}
}