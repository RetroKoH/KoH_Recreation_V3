// This script will become a general level layout script
// Used in the actual levels for all chunks

// Edit this to pull from an array?
function setup_LvlLayout(_zone){
	var dat_layout, dat_aniart;
	switch(_zone)
	{
		case ZONE.GHZ:
			dat_layout = layout_GHZ;
			dat_aniart = aniart_GHZ;
		break;
	}

	global.chunks_count = 0;
	var t = 0, tx = 0, ty = 0;

	// For every 128x128 Chunk, we need to set collision tiles based on the chunk present
	// This needs to be done twice, once for each collision plane
	for (var i = 0; i < 2; i++) {
		for (var ix = 0; ix < room_width div 128; ix++) {
			for (var iy = 0; iy < room_height div 128; iy++) {
				t = tilemap_get(global.chunks_id,ix,iy);
				if (t) {
					tx = ix*8; ty = iy*8;
					script_execute(dat_layout, i, t, tx, ty); // i=collision plane; t=tile ID; tx=tile_x; ty=tile_y;
					if (i==1) script_execute(dat_aniart, t, ix*128, iy*128);
					global.chunks_count++;
				}
			}
		}
	}
}