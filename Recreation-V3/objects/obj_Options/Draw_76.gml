/// @description Check solidity visibility
if !view_solids or menu != 5 {
	layer_set_visible(layer_get_id("Collision_A"), false);
	layer_set_visible(layer_get_id("Collision_B"), false);
}
else {
	layer_set_visible(layer_get_id("Collision_A"), true);
	layer_set_visible(layer_get_id("Collision_B"), true);
}