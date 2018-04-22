if(place_meeting(x,y+1,o_player)){
	image_speed = 1;
	if(!buff_spawned){
		instance_create_depth(x,y,1,o_speed_up);
		buff_spawned = true;
	}
}