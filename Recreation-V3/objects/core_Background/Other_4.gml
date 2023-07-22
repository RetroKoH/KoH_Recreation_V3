/// @description Load background data

switch(room){
	case screen_Title:
	//	setup_Background_Layer(bkg_ghz_00, 0, -8,  0.375, 0, -1,    0);
		setup_Background_Layer(bkg_ghz_01, 0, 24,  0.375, 0, -0.5,  0);
	//	setup_Background_Layer(bkg_ghz_02, 0, 40,  0.375, 0, -0.25, 0);
	//	setup_Background_Layer(bkg_ghz_03, 0, 56,  0.375, 0, 0,     0);
	//	setup_Background_Layer(bkg_ghz_04, 0, 104, 0.5,   0, 0,     0);
	//	setup_Background_Layer(bkg_ghz_05, 0, 144, 0.5,   0, 0,     );
		active = true;
	break;
	
	default:
		active = false;
	break;
}