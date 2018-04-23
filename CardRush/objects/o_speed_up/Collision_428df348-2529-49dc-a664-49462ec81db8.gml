for(i=0;i<5;i++){
	card = ds_list_find_value(o_deck.hand, i);
	ds_list_add(global.pile_used, card.card_type);
	card.card_type = ds_list_find_value(global.pile,0);
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

