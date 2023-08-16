/// @description Init Explosion

event_inherited();
image_speed = 1/4;			// Set the speed to play 1 frame for 8 steps. No animation table required.
gfunc_gameobj_priority_set(1);
type = 0;					// Either from a badnik, monitor, or a fire explosion.
sound = SFXs.EXPLOSION;		// Default sound effect

debug_name = "Explosion";	// Name displayed when being observed