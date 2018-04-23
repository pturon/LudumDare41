gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 200; 

menu_x = gui_width; 
menu_y = gui_height - gui_margin;
menu_x_target = gui_width/2;
menu_speed = 20; 
menu_font = f_menu;
menu_itemheight = font_get_size(f_menu);
menu_committed = -1; 
menu_control = true;

menu[2] = "Start Game";
menu[1] = "Level Selection";
menu[0] = "Quit Game";

menu_items = array_length_1d(menu);
menu_cursor = 2;
