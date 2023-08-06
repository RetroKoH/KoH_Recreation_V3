setup_Game();

var layer_id = layer_get_id("Collision_A");
global.map_id[0] = layer_tilemap_get_id(layer_id);
layer_id = layer_get_id("Collision_B");
global.map_id[1] = layer_tilemap_get_id(layer_id);

cPLAYER = instance_create_layer(88,930,"Instances",obj_Player); // 944