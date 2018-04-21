/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben
if(iframes == false){
	health  = health - 1;
	other.image_speed = 4;
	walksp = walksp_slowed;
	alarm[0] = room_speed * 2;	
	alarm[1] = room_speed * 1;
	iframes = true;
}
