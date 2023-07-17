/// @description Toggle Debug Mode
// A global.can_debug flag will be implemented to determine if this can be set.
// The flag will be set and/or cleared in the creation code of each room.
//if (room == rm_title || room == rm_SEGA || room == rm_option) exit;
global.debugmode^=true;