if(!invincible){
	health  = health - 1;
	other.image_speed = 4;
	walksp = walksp_slowed;
	has_speed_buff = false;
	alarm[0] = room_speed * 2;
	alarm[1] = room_speed;
	invincible = true;
	alarm[2] = 1;
	
	knockback = true;
	knockbacksp = 3;
	jump = true;
}
