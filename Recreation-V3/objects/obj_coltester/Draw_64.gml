/// @description Draw info

draw_text(4,4,	"CURRENT TILE: "+string(tile)+"\n"+
				"INDEX: "+string(index)+"\n"+
				"DIRECTION: "+string(dir)+"\n"+
				"COLLISION MODE: "+string(mode)+"\n"+
				"TILE ANGLE: "+string(angle)+" ("+string(global.angle_data[angle].angle)+")");

draw_text(4,128,	"LINE: "+string(line)+"\n"+
					"LENGTH at LINE: "+string(length));


