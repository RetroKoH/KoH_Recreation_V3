/// @description debug Info

draw_text(4,4,	"X-POS: "+string(x)+" ("+string(floor(x))+")"+"\n"+
				"Left Push: "+string(x-push)+" ("+string(floor(x-push))+")"+"\n"+
				"Right Push: "+string(x+push)+" ("+string(floor(x+push))+")"+"\n"+
				"Y-POS: "+string(y)+" ("+string(floor(y))+")");

var _tile = tilemap_get(global.map_id[0],mouse_x div TILE_SIZE,mouse_y div TILE_SIZE);
if _tile {
	var _index = tile_get_index(_tile);

	var _w = global.tile_widths[_index&$FF][(mouse_y mod TILE_SIZE)&(TILE_SIZE-1)];
	if tile_get_flip(_tile)
		_w = global.tile_widths[_index&$FF][(~(mouse_y mod TILE_SIZE))&(TILE_SIZE-1)];       
	if tile_get_mirror(_tile) _w = -_w;

	var _t_x = mouse_x & -TILE_SIZE, _t_edge = _t_x + abs(_w);
	draw_text(4,128,	"Tile at mouse: "+string(_tile)+"\n"+
						"Index: "+string(_index)+"\n"+
						"X-Pos: "+string(mouse_x & -TILE_SIZE)+"\n"+
						"Y-Pos: "+string(mouse_y & -TILE_SIZE)+"\n"+
						"Tile Width: "+string(_w)+"\n"+
						"Tile Edge: "+string(_t_edge));
}