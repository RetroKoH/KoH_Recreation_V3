/// @description Init badnik

event_inherited();				// Default animation and OOB settings
gfunc_gameobj_priority_set(4);	// By default, objects have a priority of 4

// Global enemy variables
can_hit		= true;		// Denotes that enemy can be hit
can_harm	= true;		// Denotes that enemy can harm on contact

// Variables applied w/ mini Sonic
hp			= 1;		// HP (Only really applies w/ mini Sonic)
flash		= 0;		// Flashing invulnerability frames. (Only really applies w/ mini Sonic)