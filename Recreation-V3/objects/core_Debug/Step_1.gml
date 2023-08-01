/// @description Get mouse's positioning within the screen

point_x = floor(device_mouse_raw_x(0) / global.win_size);
point_y = floor(device_mouse_raw_y(0) / global.win_size);