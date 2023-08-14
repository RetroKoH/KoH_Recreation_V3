function ctrl_Player_JumpHeight(){
	if jump {
		var _jmp = (in_water) ? -2 : -4;	// Underwater check
		
		// If possible, execute double jump ability 
		if (ysp > _jmp) && (double_jump != -1)
			script_execute(double_jump);
		
		if !cINPUT.k_abc_h {
			if (ysp < _jmp)
				ysp = _jmp; // Curb jump height if button(s) not held.
		}
	}
	else ysp = max(ysp, -15.75); // Cap upward mobility when NOT jumping. 
}