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
				//TODO freeze the enemy;
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
		default:
			health--;
			played = true;
			//I know, that is mean, but shouldn't occure :P
	}
	
	if(played){
		ds_list_add(global.pile_used, card_type);
		card_type = ds_list_find_value(global.pile,0);
		ds_list_delete(global.pile, 0);
			
		if(ds_list_empty(global.pile)){
			ds_list_shuffle(global.pile_used);
			for(i=0; i<ds_list_size(global.pile_used); i++){
				ds_list_add(global.pile,ds_list_find_value(global.pile_used,i));
			}
			ds_list_clear(global.pile_used);
		}
	}
}
picked = false;
global.card = noone;