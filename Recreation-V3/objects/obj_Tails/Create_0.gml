/// @description Init Tails
event_inherited();

height_def = HEIGHT_SHORT;
control_modes = ctrl_Tails;
double_jump = ctrl_Tails_StartFlight;

// Animation system related variables
gfunc_anims_init(true, global.AnimTable_PlayerTails, 0);

debug_name = "Tails";