/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben

instance_destroy(other);
if(room_next(room) != -1){
	global.current_level = room_next(room);
	room_goto_next();
}