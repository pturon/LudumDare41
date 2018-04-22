/// @description Hier Beschreibung einfügen
ds_list_shuffle(global.pile);
for(i = 0; i < 5; i++){
	var card = instance_create_depth(128+6*i*global.tile_size, 768, 1, o_card);
	card.card_type = ds_list_find_value(global.pile,0);
	ds_list_delete(global.pile, 0);
}
