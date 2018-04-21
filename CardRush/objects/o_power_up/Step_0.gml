if (place_meeting(x,y+vsp,o_wall)){
	while(place_meeting(x,y+1,o_wall)){
		y = y + 1;	
	}
	vsp = 0;
}

y = y + vsp;