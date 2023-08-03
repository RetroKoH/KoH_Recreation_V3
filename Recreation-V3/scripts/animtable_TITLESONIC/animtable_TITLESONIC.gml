// Database of sprite animations for the title screen Sonic object
function animtable_TITLESONIC(){
	global.AnimTable_TitleSonic = [];
	// ==================================================================================

	setup_Animation(global.AnimTable_TitleSonic, "Title Sonic", spr_Title_Sonic, spr_Title_Sonic, spr_Title_Sonic, -1, -1, 16, -1);

	var sp = 1/2;
	for (var i = 0; i < 10; i++)
		setup_AnimationFrame(global.AnimTable_TitleSonic, i, sp);
	sp = 1/8;
	for (i = 10; i < 18; i++)
		setup_AnimationFrame(global.AnimTable_TitleSonic, i, sp);
	// ==================================================================================

	array_push(global.AnimsIndex, global.AnimTable_TitleSonic);
}