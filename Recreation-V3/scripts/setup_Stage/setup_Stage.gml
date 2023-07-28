/// @function setup_Stage(_zone)
function setup_Stage(_zone){
	switch room 
	{	
		case stage_GHZ1:
		{
			zone_name		= "GREEN HILL";
			zone_ID			= 0;
			act_ID			= 0;
			water_flag		= false;
			water_level		= 0;
			stage_BGM		= BGMs.GHZ1;
			bound_left		= 0;
			bound_top		= 0;
			bound_right		= room_width;
			bound_bottom	= 992;
			animals	 		= noone; //[AN_FLICKY, AN_RICKY];
			next			= stage_GHZ2;
		}
		break;
		case stage_GHZ2:
		{
			zone_name		= "GREEN HILL";
			zone_ID			= 0;
			act_ID			= 1;
			water_flag		= false;
			water_level		= 0;
			stage_BGM		= BGMs.GHZ1;
			bound_left		= 2048;
			bound_top		= 0;
			bound_right		= room_width;
			bound_bottom	= 480;
			animals	 		= noone; //[AN_FLICKY, AN_RICKY];
			next			= screen_Title;
		}
		break;
		default:
		{
			zone_name		= "UNKNOWN";
			zone_ID			= 0;
			act_ID			= 0;
			water_flag		= false;
			water_level		= 0;
			stage_BGM		= noone;
			bound_left		= 0;
			bound_top		= 0;
			bound_right		= room_width;
			bound_bottom	= room_height;
			animals	 		= noone;
			next			= screen_Title;
		}
		break;
	}
}