/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben
if(fired == false){
	instance_create_depth(x-32,y,1,o_bullet_r);
	fired = true;
	alarm[0] = room_speed * 2;
}