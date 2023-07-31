function dle_GHZ1(){
	if instance_exists(obj_Player)
	{
		// Increase the vertical boundary as we go through the S-tunnels.
		if obj_Player.x < 6400
			core_Stage.target_bound_bottom = 988;
		// Increase the vertical boundary as proceed to the Act 2 layout
		else if obj_Player.x < 8080
			core_Stage.target_bound_bottom = 1248;
		else
			core_Stage.target_bound_bottom = 1496;
	}
}