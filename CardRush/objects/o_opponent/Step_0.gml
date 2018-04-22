
vsp = vsp + grv;
//Jumping
//if(place_meeting(x,y+1,o_wall) && (key_space)){
//	vsp = jumpspeed;
//}

//Vertical Collision
if(place_meeting(x,y+vsp,o_wall)){
	while(!place_meeting(x,y+sign(vsp),o_wall)){
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;

//Horizontal Collision
if(place_meeting(x+hsp,y,o_wall)){
	while(!place_meeting(x+sign(hsp),y,o_wall)){
		x = x + sign(hsp);
	}
	hsp = 0;
}

x = x + hsp;


//Animation
if(hsp < 0){
	image_xscale = -1;
} else {
	image_xscale = 1;
}
if(!place_meeting(x,y+1,o_wall)){
	sprite_index = s_opponent_a;
	image_speed = 0;
} else{
	image_speed = 1;
	if(hsp == 0){
		sprite_index = s_opponent_s;
	} else {
		sprite_index = s_opponent_r;	
	}
}

if(health == 0){
 game_end();	
}