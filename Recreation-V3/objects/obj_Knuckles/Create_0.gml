/// @description Init Knuckles
event_inherited();

control_modes	= ctrl_Knuckles;
double_jump		= ctrl_Knuckles_StartGlide;
jmp_spd			= 6;	// Reduced jump velocity

// Animation system related variables
gfunc_anims_init(true, global.AnimTable_PlayerKnuckles, 0);

debug_name = "Knuckles";