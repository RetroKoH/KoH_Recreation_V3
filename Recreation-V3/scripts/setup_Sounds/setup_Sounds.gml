/// @function setup_Sound_BGM(sound_id, name, type, loop_start, [loop_end])
function setup_Sound_BGM(_sound_id, _name, _type, _loop_start, _loop_end = 0){
	var _entry = {
		ID			: _sound_id,
		name		: _name,
		audio_type	: _type,
		loop_start	: _loop_start,	// -1 = No loop
		loop_end	: _loop_end
	}
	
	array_push(global.BGM_list, _entry);
}

/// @function setup_Sound_SFX(sound_id, name, type, loop_start, [loop_end])
function setup_Sound_SFX(_sound_id, _name){
	var _entry = {
		ID			: _sound_id,
		name		: _name
	}
	
	array_push(global.SFX_list, _entry);
}