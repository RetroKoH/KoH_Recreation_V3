/// @description Handle input

k_u_h=keyboard_check(global.keymap[KEYMAP.UP]);
k_u_p=keyboard_check_pressed(global.keymap[KEYMAP.UP]);
k_d_h=keyboard_check(global.keymap[KEYMAP.DOWN]);
k_d_p=keyboard_check_pressed(global.keymap[KEYMAP.DOWN]);
k_l_h=keyboard_check(global.keymap[KEYMAP.LEFT]);
k_l_p=keyboard_check_pressed(global.keymap[KEYMAP.LEFT]);
k_r_h=keyboard_check(global.keymap[KEYMAP.RIGHT]);
k_r_p=keyboard_check_pressed(global.keymap[KEYMAP.RIGHT]);

k_a_h=keyboard_check(global.keymap[KEYMAP.BTN_A]);
k_a_p=keyboard_check_pressed(global.keymap[KEYMAP.BTN_A]);
k_a_r=keyboard_check_released(global.keymap[KEYMAP.BTN_A]);
k_b_h=keyboard_check(global.keymap[KEYMAP.BTN_B]);
k_b_p=keyboard_check_pressed(global.keymap[KEYMAP.BTN_B]);
k_b_r=keyboard_check_released(global.keymap[KEYMAP.BTN_B]);
k_c_h=keyboard_check(global.keymap[KEYMAP.BTN_C]);
k_c_p=keyboard_check_pressed(global.keymap[KEYMAP.BTN_C]);
k_c_r=keyboard_check_released(global.keymap[KEYMAP.BTN_C]);

k_abc_h = k_a_h | k_b_h | k_c_h;
k_abc_p = k_a_p | k_b_p | k_c_p;
k_abc_r = k_a_r | k_b_r | k_c_r;

k_st_h=keyboard_check(global.keymap[KEYMAP.START]);
k_st_p=keyboard_check_pressed(global.keymap[KEYMAP.START]);
k_st_r=keyboard_check_released(global.keymap[KEYMAP.START]);
