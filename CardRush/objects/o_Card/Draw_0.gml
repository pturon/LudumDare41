x = camera_get_view_x(view_camera) +posX;
y = camera_get_view_y(view_camera) +posY;

switch(card_type){
	case "speed_up":
		sprite = s_card_freeze;
		break;
	default:
		sprite = s_card_freeze;
		break;
}

if (show) {
	draw_sprite(sprite,1,x,y-176);
} else {
	draw_sprite(sprite,1,x,y);
}
