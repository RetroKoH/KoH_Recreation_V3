/// @description Draw info

draw_text(4,4,	"CURRENT TILE: "+string(tile)+"\n"+
				"INDEX: "+string(index)+"\n"+
				"DIRECTION: "+string(dir)+"\n"+
				"COLLISION MODE: "+string(mode)+"\n"+
				"TILE ANGLE: "+string(angle)+" ("+string(global.angle_data[angle].angle)+")");

var _pos = mode mod 2 == 0 ? mouse_y : mouse_x;
draw_text(4,128,	"CURSOR: "+string(_pos)+"\n"+
					"LINE: "+string(line)+"\n"+
					"LENGTH at LINE: "+string(length)+"\n"+
					"DISTANCE to TILE: "+string(dist));


