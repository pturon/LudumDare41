/// @description Hier Beschreibung einfügen
x_offset = camera_get_view_x(view_camera) + window_get_width()/2;
y_offset = camera_get_view_y(view_camera) + global.tile_size;
ds_list_size(global.pile)
ds_list_size(global.pile_used)
draw_sprite(s_pile,1,x_offset - global.tile_size/2,y_offset);
draw_sprite(s_pile_used,1,x_offset + global.tile_size/2,y_offset);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_text(x_offset - global.tile_size/2,y_offset + global.tile_size/2, health)
draw_text(x_offset + global.tile_size/2,y_offset + global.tile_size/2, ds_list_size(global.pile_used))