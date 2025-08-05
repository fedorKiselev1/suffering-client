draw_self()
if instance_exists(oEnemyClient) {
	draw_set_alpha(1)
	draw_set_color(c_maroon)
	draw_self()
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(x, y - 64, oEnemyClient.username)
}