if (picked && mouse_y < 627) {
		//TODO Animation beim Spielen einer Karte
	played = false;
	switch(card_type){
		case "speed_up":
			if(global.mana >= 2){
				global.mana = global.mana - 2;
				o_player.walksp = o_player.walksp_buffed;
				o_player.alarm[0]=room_speed * 3;
				o_player.has_speed_buff = true;
				played = true;
			}		
			break;
		case "freeze":
			if(global.mana >= 3){
				global.mana = global.mana - 3;
				o_opponent.freezed = true;
				o_opponent.alarm[5] = room_speed * 2;
				played = true;
			}
			break;
		case "manaflow":
			if(global.mana >= 1){
				global.mana = global.mana + 2;
				played = true;
			}
			break;
		case "jumping_power":
			if(global.mana >= 2){
				global.mana = global.mana - 2;
				o_player.jumpspeed = o_player.jumpspeed_buffed;
				o_player.alarm[3]=room_speed * 3;
				o_player.has_jump_buff = true;
				played = true;
			}		
			break;
		case "shield":
			if(global.mana >= 2){
				global.mana = global.mana - 2;
				o_player.has_shield = true;
				o_player.alarm[4]=room_speed * 5;
				played = true;
			}
			break;
		case "healing":
			if(global.mana >= 3){
				global.mana = global.mana - 3;
				if(health < global.max_hp){
					health++;					
				}
				played = true;
			}
			break;
		case "slow":
			if(global.mana >= 2){
				global.mana = global.mana - 2;
				o_opponent.walksp = o_opponent.walksp_slowed;
				o_opponent.alarm[0] = room_speed * 3;
				played = true;
			}
			break;
		case "fireball":
			if(global.mana >= 2){
				global.mana = global.mana - 2;
				if(o_player.last_direction<0){
					fireball = instance_create_depth(o_player.x-32,o_player.y-32,1,o_bullet_l);
					fireball.hsp = -20;
				} else {
					fireball = instance_create_depth(o_player.x+32,o_player.y-40,1,o_bullet_r);
					fireball.hsp = 20;
				}
				fireball.owner=o_player;
				played = true;
			}
			break;
		case "gravity_field":
			if(global.mana >= 2){
				global.mana = global.mana - 2;
				o_opponent.jumpspeed = o_opponent.jumpspeed_debuffed;
				o_opponent.alarm[3] = room_speed * 4;
				played = true;
			}
			break;
		case "cleanse":
			if(global.mana >= 3){
				global.mana = global.mana - 3;
				o_player.knockback = false;
				o_player.jump = false;
				if(!o_player.has_speed_buff){
					o_player.walksp = o_player.walksp_normal;
				}
				if(!o_player.has_jump_buff){
					o_player.jumpspeed = o_player.jumpspeed_normal;
				}
				played = true;
			}
			break;
		default:
			played = true;
			//I know, that is mean, but shouldn't occure :P
	}
	
	if(played){
		ds_list_add(global.pile_used, card_type);
		card_type = ds_list_find_value(global.pile,0);
		ds_list_delete(global.pile, 0);
			
		if(ds_list_empty(global.pile)){
			for(i = 0; i <= irandom(10);i++){
				ds_list_shuffle(global.pile_used);
			}
			for(i=0; i<ds_list_size(global.pile_used); i++){
				ds_list_add(global.pile,ds_list_find_value(global.pile_used,i));
			}
			ds_list_clear(global.pile_used);
		}
	}
}
picked = false;
global.card = noone;