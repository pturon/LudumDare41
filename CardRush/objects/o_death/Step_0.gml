  menu_x += (menu_x_target - menu_x) / menu_speed;

if(menu_control){
	if(keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))){
		menu_cursor ++;
		if(menu_cursor >= menu_items) menu_cursor = 0;
	}
	if(keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))){
		menu_cursor --;
		if(menu_cursor < 0) menu_cursor = menu_items - 1;
	}
	if(keyboard_check_pressed(vk_enter)){
		switch(menu_cursor){
			case 0: 
				game_end(); 
				break;
			case 1: 
				room_goto(r_main_menu);
				break;
			case 2: 
				room_goto(r_level);
				break;
		}
	}
}
                             