/// @description Hier Beschreibung einfügen
draw_self();
if(freezed) {
	shader_set(sh_frozen);
	draw_self();
	shader_reset();
}