/// @description Init input variables
ignore_input = false;	// Non-gameplay input doesn't apply here.

// _h = held. _p = pressed. _r = released.
k_l_h=false; // LEFT
k_l_p=false;
k_r_h=false; // RIGHT
k_r_p=false;
k_u_h=false; // UP
k_u_p=false;
k_d_h=false; // DOWN
k_d_p=false;

k_a_h=false; // A button
k_a_p=false;
k_a_r=false;
k_b_h=false; // B button
k_b_p=false;
k_b_r=false;
k_c_h=false; // C button
k_c_p=false;
k_c_r=false;

k_abc_h=false;	// Handler for all three buttons noted above
k_abc_p=false;
k_abc_r=false;

k_st_h=false; // Start
k_st_p=false;
k_st_r=false;
k_md_h=false; // Mode
k_md_p=false;
k_md_r=false;

// Set default input controller and deadzone for gamepad (Thank you Orbinaut Framework)
if gamepad_is_connected(0) or gamepad_is_connected(4)
		type = "Gamepad";
else	type = "Keyboard";
	
gamepad_set_axis_deadzone(0, 0.3); gamepad_set_axis_deadzone(4, 0.3);
