if(!invincible && !has_shield && !knockback){
	health  = health - 1;
	other.image_speed = 4;
	walksp = walksp_slowed;
	alarm[0] = room_speed * 2;
	alarm[1] = room_speed;
	invincible = true;
	alarm[2] = 1;
	
	knockback = true;
	knockbacksp = 3 * sign(hsp) * -1;
	jump = true;
}
if(has_shield){
	alarm[1] = room_speed;
	invincible = true;
	has_shield = false;
}