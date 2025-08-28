draw_self()

draw_set_font(fScore)
draw_set_color(c_white)
draw_set_halign(fa_center)
draw_set_valign(fa_bottom)

if instance_exists(oPlayerClient) && instance_exists(oEnemyClient) {
	draw_text(x, y + 8, $"{playerscore}:{enemyscore}")
}