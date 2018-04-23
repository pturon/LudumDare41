/// @description Hier Beschreibung einfügen
ds_list_clear(global.pile_used);
ds_list_clear(hand);
ds_list_clear(global.pile);
for(i=0; i<ds_list_size(global.deck);i++){
	ds_list_add(global.pile, ds_list_find_value(global.deck,i));
}
for(i = 0; i <= irandom(10);i++){
	ds_list_shuffle(global.pile);	
}
for(i = 0; i < 5; i++){
	card = instance_create_depth(128+6*i*global.tile_size, 768, 1, o_card);
	card.card_type = ds_list_find_value(global.pile,0);	
	ds_list_add(hand,card);
	ds_list_delete(global.pile, 0);
}
