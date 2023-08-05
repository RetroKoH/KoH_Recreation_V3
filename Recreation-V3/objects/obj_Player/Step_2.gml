/// @description Post-Object handling

// Set sprite direction
anim_direction = flipped ? -1 : 1;

// Hard set animation if pushing
if (pushing)
	anim_ID = ANI_PLAYER.PUSH;

// Manage speed and animations when running or rolling
var _a = abs(inertia);

switch(anim_ID)
{
    case ANI_PLAYER.WALK:
	case ANI_PLAYER.JOG:
    case ANI_PLAYER.RUN:
    case ANI_PLAYER.DASH:
	{
	    if (_a >= 10)		anim_ID = ANI_PLAYER.DASH;
	    else if (_a >= 6)	anim_ID = ANI_PLAYER.RUN;
		else if (_a >= 4)	anim_ID = ANI_PLAYER.JOG;
	    else				anim_ID = ANI_PLAYER.WALK;
		anim_speedmod = 2 / max(8 - abs(inertia), 1);
	}
	break;
    case ANI_PLAYER.ROLL:
        anim_speedmod = 2 / max(5 - _a, 1);
	break;
    case ANI_PLAYER.SPRING:
		if ysp >= 0			anim_ID = ANI_PLAYER.FALL;
	default:
        anim_speedmod = 1;
}

gfunc_anims_update();