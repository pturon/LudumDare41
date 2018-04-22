x = camera_get_view_x(view_camera) + posX;
y = camera_get_view_y(view_camera) +posY;


if (picked) {
	x = x + display_mouse_get_x() - mouse_pressed_x;
	y = y + display_mouse_get_y() - mouse_pressed_y;
}


switch(card_type){
	case "speed_up":
		sprite = s_card_speed_up;
		break;
	case "freeze":
		sprite = s_card_freeze;
		break;
	case "jumping_power":
		sprite = s_card_jumping_power;
		break;
	case "manaflow":
		sprite = s_card_manaflow;
		break;
	case "healing":
		sprite = s_card_healing;
		break;
	case "shield":
		sprite = s_card_shield;
		break;
	default:
		sprite = s_card_back;
		break;
}

if (show) {
	draw_sprite(sprite,1,x,y-176);
} else {
	draw_sprite(sprite,1,x,y);
}
