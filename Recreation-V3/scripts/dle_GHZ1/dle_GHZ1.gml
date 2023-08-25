function dle_GHZ1(){
	if instance_exists(obj_Player)
	{
// Starting boundary
		if obj_Player.x < 6400
			core_Stage.target_bound_bottom = 988;
// Increase the vertical boundary as we go through the S-tunnels.
		else if obj_Player.x < 8080
			core_Stage.target_bound_bottom = 1248;
// Increase the vertical boundary as we proceed into the Act 2 layout
		else if obj_Player.x < 11532
			core_Stage.target_bound_bottom = 1496;
// Decrease the vertical boundary as proceed to the vertical pillars
		else if obj_Player.x < 13550
			core_Stage.target_bound_bottom = 1248;
// Increase again to allow access to the bottom path
		else if obj_Player.x < 15410
			core_Stage.target_bound_bottom = 1760;
// Final bottom boundary headed to the signpost
		else
			core_Stage.target_bound_bottom = 1496;
	}
}