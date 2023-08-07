var layer_id = layer_get_id("Collision_A");
global.map_id[0] = layer_tilemap_get_id(layer_id);
layer_id = layer_get_id("Collision_B");
global.map_id[1] = layer_tilemap_get_id(layer_id);

scr_setup_collision();

instance_create_layer(224,130,"Instances",obj_Player); // 944