/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben
for(i = 0; i < ds_list_size(global.pile_used); i++){
	used_card = ds_list_find_value(global.pile_used,i);
	ds_list_add(global.pile,used_card);
}
for(i = 0; i < ds_list_size(hand); i++){
	hand_card = ds_list_find_value(hand,i);
	show_debug_message(ds_list_size(hand));
	show_debug_message(typeof(hand_card));
	show_debug_message(hand_card.card_type);
	ds_list_add(global.pile,hand_card.card_type);
}
ds_list_clear(hand);
ds_list_clear(global.pile_used);