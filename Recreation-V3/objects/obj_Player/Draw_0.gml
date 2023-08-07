/// @description Render animation

gfunc_anims_draw();

// Col Sensor A (Left Floor)
draw_sprite_stretched_ext(spr_col_line,0, floor(x)-(width-1), floor(y), 1,height+1, c_lime,1);

// Col Sensor B (Right Floor)
draw_sprite_stretched_ext(spr_col_line,0, floor(x)+(width-1), floor(y), 1,height+1,c_aqua,1);

// Col Sensor C (Left Ceiling)
draw_sprite_stretched_ext(spr_col_line,0, floor(x)-(width-1), floor(y)-height, 1,height+1,#0088FF,1);

// Col Sensor D (Right Ceiling)
draw_sprite_stretched_ext(spr_col_line,0, floor(x)+(width-1), floor(y)-height, 1,height+1,c_yellow,1);

var _gr = !(in_air) and (angle < 11.25 || angle > 348.75) ? 0 : 0;

// Col Sensor E (Left Wall)
draw_sprite_stretched_ext(spr_col_line,0, floor(x)-width, floor(y)+_gr, width+1,1, c_fuchsia,1);
draw_sprite(spr_col_line,0, floor(x)-width, floor(y)+_gr);

// Col Sensor F (Right Wall)
draw_sprite_stretched_ext(spr_col_line,0, floor(x), y+_gr, width+1,1, c_red,1);
draw_sprite(spr_col_line,0, floor(x)+width, floor(y)+_gr);

// Center
draw_sprite(spr_col_line,0, floor(x), floor(y)+_gr);