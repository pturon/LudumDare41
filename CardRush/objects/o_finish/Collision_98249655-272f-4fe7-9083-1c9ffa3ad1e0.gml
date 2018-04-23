/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben
global.current_level = room_next(room);
if(room_next(room) != -1){	
	room_goto_next();
} else {
	room_goto(r_main_menu);
}