/// @description Default Game Object Properties

gfunc_gameobj_OOB_set(OOB_RESET);	// By default, objects are reset when out-of-bounds
gfunc_anims_init(false);			// By default, objects don't use the animation system

routine	= 0;		// Action routine counter.
xsp		= 0;		// X-movement speed (Not used by all)
ysp		= 0;		// Y-movement speed (Not used by all)

child_sprites	= [];				// Child Sprite ID table (Not used by all)
sprite_override	= noone;			// Sprite to override animation table with.

debug_name		= "Game Object";	// Name displayed when being observed