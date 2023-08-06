/// @description Insert description here
// You can write your code in this editor

draw_text(4,4,	"XSP: "+string(xsp)+"\n"+
				"YSP: "+string(ysp)+"\n"+
				"Inertia: "+string(inertia))
				
var _tile	= tilemap_get(global.map_id[0], mouse_x div 16, mouse_y div 16);
var _index	= tile_get_index(_tile);
var _len	= gfunc_tile_get_length(mouse_x, mouse_y, _tile, _index, COL_FLOOR);
var _dist	= (mouse_x & -16) + (16 - _len - 1) - mouse_x;

draw_text(120,4, "MOUSE X: "+string(mouse_x)+"\n"+
				"MOUSE Y: "+string(mouse_y)+"\n"+
				"TILE: "+string(_tile)+"\n"+
				"INDEX: "+string(_index)+"\n"+
				"LENGTH: "+string(_len)+"\n"+
				"DIST: "+string(_dist));