if(jump){
	vsp = jumpspeed;
	jump = false;
} else {
	vsp = vsp + grv;
}
hsp = walksp;

//Vertical Collision
if(place_meeting(x,y+vsp,o_wall)){
	if(!place_meeting(x,y+vsp,o_block)){
		while(!place_meeting(x,y+sign(vsp),o_wall)){
		y = y + sign(vsp);
		}
		vsp = 0;
		walksp = 0;
	}
} 
y = y + vsp;

//Horizontal Collision
if(place_meeting(x+hsp,y,o_wall)){
	if(!place_meeting(x+hsp,y,o_block)){
		while(!place_meeting(x+sign(hsp),y,o_wall)){
			x = x + sign(hsp);
		}
		hsp = 0;
		walksp = 0;
	}
}

x = x + hsp;




