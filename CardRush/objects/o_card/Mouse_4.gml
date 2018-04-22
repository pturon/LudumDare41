/// Pick the card
if (global.card == noone){
	picked = true;
	global.card = self;
	mouse_pressed_x = display_mouse_get_x() ;
	mouse_pressed_y = display_mouse_get_y() ;
}
