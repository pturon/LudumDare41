if(!other.hasbuff){
	other.walksp = other.walksp_buffed;
	alarm[0]=room_speed * 2;
	other.hasbuff = true;
	image_index = s_clear;
}
