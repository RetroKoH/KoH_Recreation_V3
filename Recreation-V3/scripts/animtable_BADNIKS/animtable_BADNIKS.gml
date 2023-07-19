function animtable_BADNIKS(){
	animtable_BUZZBOMBER();
	animtable_CRABMEAT();
	animtable_MOTOBUG();
	animtable_NEWTRON();
}

// Database of sprite animations for the buzz bomber badnik
function animtable_BUZZBOMBER(){
	global.AnimTable_BuzzBomber = [];
	// ==================================================================================
	
	// Need to add wings to the frames
	setup_Animation(global.AnimTable_BuzzBomber, "Idle", spr_BuzzBomber, spr_BuzzBomber, spr_BuzzBomber, -1, -1, 0, -1);

	setup_AnimationFrame(global.AnimTable_BuzzBomber, 0, 1);
	// ==================================================================================

	// Will use FIRE subanimation (And need to add wings)
	setup_Animation(global.AnimTable_BuzzBomber, "Moving", spr_BuzzBomber, spr_BuzzBomber, spr_BuzzBomber, -1, -1, 0, -1);
	
	setup_AnimationFrame(global.AnimTable_BuzzBomber, 0, 1);
	// ==================================================================================

	// Will use FIRE subanimation (And need to add wings)
	setup_Animation(global.AnimTable_BuzzBomber, "Firing", spr_BuzzBomber, spr_BuzzBomber, spr_BuzzBomber, -1, -1, 2, -1);

	var sp=1/2;
	setup_AnimationFrame(global.AnimTable_BuzzBomber, 1, sp);
	setup_AnimationFrame(global.AnimTable_BuzzBomber, 2, sp);
	setup_AnimationFrame(global.AnimTable_BuzzBomber, 3, 1);
	// ==================================================================================

	array_push(global.AnimsIndex,global.AnimTable_BuzzBomber);
}

// Database of sprite animations for the crabmeat badnik
function animtable_CRABMEAT(){
	global.AnimTable_Crabmeat = [];
	// ==================================================================================
	
	setup_Animation(global.AnimTable_Crabmeat, "Idle", spr_Crabmeat, spr_Crabmeat, spr_Crabmeat, -1, -1, 0, -1);

	setup_AnimationFrame(global.AnimTable_Crabmeat, 0, 1);
	// ==================================================================================

	setup_Animation(global.AnimTable_Crabmeat, "Moving", spr_Crabmeat, spr_Crabmeat, spr_Crabmeat, -1, -1, 0, -1);
	
	var sp=1/16;
	setup_AnimationFrame(global.AnimTable_Crabmeat, 1, sp);
	setup_AnimationFrame(global.AnimTable_Crabmeat, 2, sp);
	setup_AnimationFrame(global.AnimTable_Crabmeat, 0, sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_Crabmeat, "Firing", spr_Crabmeat, spr_Crabmeat, spr_Crabmeat, -1, -1, 0, -1);

	setup_AnimationFrame(global.AnimTable_Crabmeat, 3, 1);
	// ==================================================================================

	array_push(global.AnimsIndex,global.AnimTable_Crabmeat);
}

// Database of sprite animations for the chopper badnik
function animtable_CHOPPER(){
	global.AnimTable_Chopper = [];
	// ==================================================================================
	
	setup_Animation(global.AnimTable_Chopper, "Up", spr_Chopper, spr_Chopper, spr_Chopper, -1, -1, 0, -1);

	var sp = 1/8;
	setup_AnimationFrame(global.AnimTable_Chopper, 0, sp);
	setup_AnimationFrame(global.AnimTable_Chopper, 1, sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_Chopper, "Peak", spr_Chopper, spr_Chopper, spr_Chopper, -1, -1, 0, -1);

	var sp = 1/4;
	setup_AnimationFrame(global.AnimTable_Chopper, 0, sp);
	setup_AnimationFrame(global.AnimTable_Chopper, 1, sp);
	// ==================================================================================

	array_push(global.AnimsIndex,global.AnimTable_Chopper);
}

// Database of sprite animations for the motobug badnik
function animtable_MOTOBUG(){
	global.AnimTable_Motobug = [];
	// ==================================================================================
	
	setup_Animation(global.AnimTable_Motobug, "Idle", spr_Motobug, spr_Motobug, spr_Motobug, -1, -1, 0, -1);

	setup_AnimationFrame(global.AnimTable_Motobug, 2, 1);
	// ==================================================================================

	setup_Animation(global.AnimTable_Motobug, "Moving", spr_Motobug, spr_Motobug, spr_Motobug, -1, -1, 0, -1);

	var sp=1/6;
	setup_AnimationFrame(global.AnimTable_Motobug, 0, sp);
	setup_AnimationFrame(global.AnimTable_Motobug, 1, sp);
	setup_AnimationFrame(global.AnimTable_Motobug, 0, sp);
	setup_AnimationFrame(global.AnimTable_Motobug, 2, 1/7);
	// ==================================================================================

	array_push(global.AnimsIndex,global.AnimTable_Motobug);
}

// Database of sprite animations for the newtron badnik
function animtable_NEWTRON(){
	global.AnimTable_Newtron = [];
	// ==================================================================================

	setup_Animation(global.AnimTable_Newtron, "Idle", spr_Newtron, spr_Newtron, spr_Newtron, -1, -1, 0, -1);
	
	setup_AnimationFrame(global.AnimTable_Newtron, 0, 1);
	// ==================================================================================

	setup_Animation(global.AnimTable_Newtron, "Drop Down", spr_Newtron, spr_Newtron, spr_Newtron, -1, -1, 4, -1);

	var sp = 1/20;
	setup_AnimationFrame(global.AnimTable_Newtron, 0, sp);
	setup_AnimationFrame(global.AnimTable_Newtron, 0, sp);
	setup_AnimationFrame(global.AnimTable_Newtron, 2, sp);
	setup_AnimationFrame(global.AnimTable_Newtron, 3, sp);
	setup_AnimationFrame(global.AnimTable_Newtron, 4, sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_Newtron, "Fly", spr_Newtron, spr_Newtron, spr_Newtron, -1, -1, 0, -1);
	
	sp = 1/3;
	setup_AnimationFrame(global.AnimTable_Newtron, 5, sp);
	setup_AnimationFrame(global.AnimTable_Newtron, 6, sp);
	// ==================================================================================

	setup_Animation(global.AnimTable_Newtron, "Shoot", spr_Newtron, spr_Newtron, spr_Newtron, -1, 0, 0, -1);

	sp = 1/20;
	// Animation frames
		repeat(3) setup_AnimationFrame(global.AnimTable_Newtron, 0, sp);
		setup_AnimationFrame(global.AnimTable_Newtron, 1, sp);
		repeat(3) setup_AnimationFrame(global.AnimTable_Newtron, 0, sp);
	// ==================================================================================

	array_push(global.AnimsIndex, global.AnimTable_Newtron);
}