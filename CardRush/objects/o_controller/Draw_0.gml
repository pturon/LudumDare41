x_offset_hp = camera_get_view_x(view_camera) + window_get_width() - global.tile_size;
y_offset_hp = camera_get_view_y(view_camera) + global.tile_size;
x_offset_mana = camera_get_view_x(view_camera) + + global.tile_size;
y_offset_mana = camera_get_view_y(view_camera) + global.tile_size;
x_offset_mana_prog = x_offset_mana - global.tile_size/2;
y_offset_mana_prog = y_offset_mana + global.tile_size/2;

if(global.manaflow = global.manaflow_needed-1 && global.mana<global.max_mana)
{
	global.mana++;
}
global.manaflow = (global.manaflow+1) %global.manaflow_needed;

for (i=0;i<global.max_hp;i++)
{
	if (i < health)
	{
		draw_sprite(s_heart_full,1,x_offset_hp - i*global.tile_size,y_offset_hp);
	} else
	{
		draw_sprite(s_heart_empty,1,x_offset_hp - i*global.tile_size,y_offset_hp);
	}
}

for (i=0;i<global.max_mana;i++)
{
	if (i<global.mana)
	{
		draw_sprite(s_mana_crystal_full,1,x_offset_mana + i*global.tile_size,y_offset_mana);
	} else
	{
		draw_sprite(s_mana_crystal_empty,1,x_offset_mana + i*global.tile_size,y_offset_mana);
	}
}

draw_sprite(s_mana_prog_background,1,x_offset_mana_prog,y_offset_mana_prog);
draw_sprite_ext(s_mana_prog_inner,1,x_offset_mana_prog,y_offset_mana_prog,global.manaflow/global.manaflow_needed,1,0,c_white,1);
draw_sprite(s_mana_prog_border,1,x_offset_mana_prog,y_offset_mana_prog);
