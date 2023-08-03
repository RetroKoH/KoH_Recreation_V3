/// @description Animation Handling

// Animation direction
anim_direction = flipped ? -1 : 1;

// Hard set pushing animation
if pushing
	anim_ID = ANI_PLAYER.PUSH;

// Manage Animation Speed, and switch running animations
switch(anim_ID)
{
    case ANI_PLAYER.WALK:
	case ANI_PLAYER.JOG:
    case ANI_PLAYER.RUN:
    case ANI_PLAYER.DASH:
	{
		if abs(inertia) >= 10		anim_ID = ANI_PLAYER.DASH;
		else if abs(inertia) >= 6	anim_ID = ANI_PLAYER.RUN;
		else if abs(inertia) >= 4	anim_ID = ANI_PLAYER.JOG;
		else						anim_ID = ANI_PLAYER.WALK;
	
		anim_speedmod = 2 / max(8 - abs(inertia), 1);
	}
	break;

    case ANI_PLAYER.ROLL:
        anim_speedmod = 2 / max(5 - abs(inertia), 1);
	break;

    case ANI_PLAYER.SPRING:
		if ysp >= 0
			anim_ID = ANI_PLAYER.FALL;

	default:
        anim_speedmod=1;
}

