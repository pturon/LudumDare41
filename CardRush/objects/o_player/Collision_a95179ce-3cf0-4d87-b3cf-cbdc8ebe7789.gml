/// @description Speedbuff
// Sie können Ihren Code in diesem Editor schreiben
instance_destroy(other);
if(!has_speed_buff){
	walksp = walksp_buffed;
	alarm[0]=room_speed * 4;
	has_speed_buff = true;
}

