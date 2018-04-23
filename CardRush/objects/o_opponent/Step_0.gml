//Input
key_left = false;
key_right = false;
key_space = false;
key_down = false;

if(!knockback && !freezed){	
	//get possible dangers
	nearest_enemy = instance_nearest(x,y,o_enemy_easy);
	nearest_bullet_l = instance_nearest(x,y,o_bullet_l);
	nearest_bullet_r = instance_nearest(x,y,o_bullet_r);
	nearest_canon_l = instance_nearest(x,y,o_canon_l);
	nearest_canon_r = instance_nearest(x,y,o_canon_r);
	
	//is he waiting for a bypassing bullet?
	show_debug_message("x: ");
	show_debug_message(nearest_canon_l.x-x);
	show_debug_message("y: ");
	show_debug_message(y-nearest_canon_l.y);
	if(wait_for_bullet){
		if(nearest_bullet_l != noone && x-nearest_bullet_l.x<global.tile_size*1.5 && y-nearest_bullet_l.y<global.tile_size*2 && y-nearest_bullet_l.y>global.tile_size){
			key_right=true;
			key_space=true;
			wait_for_bullet = false;
		} else {
			key_down = true;		
		}
	//should he though?
	} else if(nearest_canon_l != noone && place_meeting(x,y+1,o_wall) && nearest_canon_l.x-x<global.tile_size*5 && nearest_canon_l.x-x>global.tile_size && y-nearest_canon_l.y<global.tile_size*2 && y-nearest_canon_l.y>global.tile_size){
		key_down = true;	
		wait_for_bullet = true;
	//is simple running right possible?	
	} else if(!place_meeting(x+walksp,y,o_wall) && (place_meeting(x+walksp,y+global.tile_size,o_wall) || place_meeting(x+walksp,y+global.tile_size*2.5,o_wall))){
		key_right = true;
		show_debug_message(walksp);
		//jump to avoid stuff on walking height
		if(place_meeting(x+walksp*4,y,o_enemy_easy) || place_meeting(x+walksp*4,y,o_canon_l) || place_meeting(x+walksp*4,y,o_bullet_l) || place_meeting(x+walksp*8,y,o_canon_l) || place_meeting(x+walksp*8,y,o_bullet_l) || place_meeting(x+walksp*12,y,o_canon_l) || place_meeting(x+walksp*12,y,o_bullet_l)){
			key_space = true;
		}
		
	} else {
		//standing in front of a step
		if(place_meeting(x+walksp,y,o_wall) && !place_meeting(x+walksp,y-global.tile_size,o_wall)){
			key_space = true;
			key_right = true;
		//standing in front of a ledge
		} else if(place_meeting(x,y+1,o_wall) && !place_meeting(x+walksp,y+global.tile_size,o_wall)){
			//key_space = true;
			//key_right = true;
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
if(place_meeting(x,y+1,o_wall) && (key_space) && !freezed){
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
		if(key_down){
			sprite_index = s_opponent_c;
		} else {
			sprite_index = s_opponent_s;
		}		
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