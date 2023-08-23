function gfunc_anim_sync_run() {
	
	for (var _i = 0; _i < 3; _i++) {
		if global.sync_anim[_i].time == 0 {
			global.sync_anim[_i].time = global.sync_anim[_i].reset_time;
			
			// Increment frames
			if global.sync_anim[_i].frame == global.sync_anim[_i].frame_cap
				global.sync_anim[_i].frame = 0;
			else
				global.sync_anim[_i].frame++;
		}
		else global.sync_anim[_i].time--;	// If timer isn't reset, it counts down
	}
}

function gfunc_anim_sync_reset() {
	for (var _i = 0; _i < 3; _i++) {
		global.sync_anim[_i].time = 0;
		global.sync_anim[_i].frame = 0
	}
}