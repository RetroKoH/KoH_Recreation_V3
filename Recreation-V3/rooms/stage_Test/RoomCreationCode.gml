var layer_id = layer_get_id("Collision_A");
global.map_id[0] = layer_tilemap_get_id(layer_id);
layer_id = layer_get_id("Collision_B");
global.map_id[1] = layer_tilemap_get_id(layer_id);

setup_Collision();

instance_create_layer(0,0,"Instances",obj_coltester);
//instance_create_layer(224,130,"Instances",obj_Player); // 944