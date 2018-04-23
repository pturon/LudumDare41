if(!invincible && !has_shield && other.image_speed==0 && !knockback){
	global.enemy_health--;
	walksp = walksp_slowed;
	has_speed_buff = false;
	alarm[0] = room_speed * 2;
	alarm[1] = room_speed;
	alarm[2] = 1;
	invincible = true;	
	knockback = true;
	knockbacksp = -3;
	jump = true;
}
other.image_speed = 4;
has_shield = false;
