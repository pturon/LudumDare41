/// @description Hier Beschreibung einfügen
hand=ds_list_create();
global.pile_used = ds_list_create();
global.pile = ds_list_create();
for(i=0; i<ds_list_size(global.deck);i++){
	ds_list_add(global.pile, ds_list_find_value(global.deck,i));
}