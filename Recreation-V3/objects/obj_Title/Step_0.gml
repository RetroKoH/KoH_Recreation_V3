/// @description Main

switch(routine)
{
	case 0:
		if ++wait_timer == 10 {
			routine++;
			gfunc_fade_perform(FADEMODE_INTO, FADEBLEND_BLACK, 0);
		}
	break;
	
	case 1:
		if ++wait_timer == 60 {
			routine++;
			gfunc_fade_perform(FADEMODE_FROM, FADEBLEND_BLACK, 1);
		}
	break;
	
	case 2:		
		if ++wait_timer == 80 {
			routine++;
			//visible = true;
			wait_timer = 0;
		}
	break;
	
	case 3:		
		if ++wait_timer == 10 {
			routine++;
			wait_timer = 0;
		}
	break;
}