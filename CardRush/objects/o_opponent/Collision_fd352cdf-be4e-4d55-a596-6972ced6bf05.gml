other.image_speed = 4;
if(!invincible && !has_shield){
	health  = health - 1;
	walksp = walksp_slowed;
	has_speed_buff = false;
	alarm[0] = room_speed * 2;
	alarm[1] = room_speed;
	alarm[2] = 1;
	invincible = true;	
	knockback = true;
	knockbacksp = 3;
	jump = true;
}
has_shield = false;