//Input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_space = keyboard_check_pressed(vk_space);

//Movement
var move = key_right - key_left;
hsp = move * walksp;

vsp = vsp + grv;

//Jumping
if(place_meeting(x,y+1,o_wall) && (key_space)){
	vsp = jumpspeed;
}

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
	sprite_index = s_player_a;
	image_speed = 0;
} else{
	image_speed = 1;
	if(hsp == 0){
		sprite_index = s_player_s;
	} else {
		sprite_index = s_player_r;	
	}
}


