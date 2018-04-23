/// @description Hier Beschreibung einfügen
draw_self();
if(has_shield) {
	shader_set(sh_shielded);
	draw_self();
	shader_reset();
}