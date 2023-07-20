/// @description Main

	switch (++wait_timer)
	{
		case 80:
			gfunc_fade_perform(FADEMODE_FROM, FADEBLEND_BLACK, 1);
		break;
		case 320:
			gfunc_fade_perform(FADEMODE_INTO, FADEBLEND_BLACK, 1);
		break;
		//case 180:
		//	room_goto(global.StartRoom);
		//break;
	}


