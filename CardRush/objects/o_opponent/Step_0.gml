//Input
key_left = false;
key_right = false;
key_space = false;
key_down = false;

if(!knockback){	
	//is running right possible?
	if(!place_meeting(x+walksp,y,o_wall) && place_meeting(x+walksp,y+global.tile_size,o_wall)){
		key_right = true;
		if(place_meeting(x+global.tile_size,y,o_enemy_easy) || place_meeting(x+global.tile_size*2,y,o_canon_l) || place_meeting(x+global.tile_size*2,y,o_bullet_l)){
			key_space = true;
		}
		
	} else {
		if(place_meeting(x+walksp,y,o_wall) && !place_meeting(x+walksp,y-global.tile_size,o_wall)){
			key_space = true;
			key_right = true;
		} else if(!place_meeting(x+walksp,y+global.tile_size,o_wall)){
			key_space = true;
			key_right = true;
		}
	}
}

//Movement
if(freezed){
	hsp = 0;
	vsp = vsp + grv;
} else if(!knockback){
	var move = key_right - key_left;
	hsp = move * walksp;
	vsp = vsp + grv;
} else {
	if(jump){
		vsp = jumpspeed;
		jump = false;
	}
	hsp = knockbacksp;                
	vsp = vsp + grv;		
}


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
	knockback = false;
}
if(place_meeting(x,y,o_spikes)){
	if(!invincible && !knockback && !has_shield){
		health--;
		alarm[2] = 1;
	}
	alarm[1]=room_speed;
	invincible = true;
	has_shield = false;
}

y = y + vsp;

//Horizontal Collision
if(place_meeting(x+hsp,y,o_wall)){
	while(!place_meeting(x+sign(hsp),y,o_wall)){
		draw_text(100,100,x);
		draw_text(100,150,y)
		x = x + sign(hsp);
	}
	hsp = 0;
	knockback = false;
}
if(x+hsp<0 || x+hsp > room_width){
	hsp = 0;
	knockback = false;
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

//Respawn
if(global.enemy_health == 0){
	walksp = walksp_normal;
	invincible = false;	
	knockback = false;
	jump = false;
	x = posX;
	y = posY;
	hsp = 0;
	vsp = 0;
	global.enemy_health  = 3;
}