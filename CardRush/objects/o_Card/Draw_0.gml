x = camera_get_view_x(view_camera) +posX;
y = camera_get_view_y(view_camera) +posY;
if (show)
{
	draw_sprite(s_card_freeze,1,x,y-176);
} else
{
	draw_sprite(s_card_freeze,1,x,y);
}
