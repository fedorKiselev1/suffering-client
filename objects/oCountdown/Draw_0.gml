draw_self()
draw_sprite_ext(sClockarmsmall, 0, x, y, 1, 1, 0, c_white, 1)

draw_sprite_ext(sClockarmbig, 0, x, y, 1, 1, clockarmangleshown, c_white, 1)


draw_set_color(c_white)
draw_set_halign(fa_center)
draw_set_valign(fa_bottom)
draw_set_alpha(1)

if instance_exists(oPlayerClient) && instance_exists(oEnemyClient) {
	draw_set_font(fScore)
	draw_text(x, y + 220, $"{playerscore}:{enemyscore}")
	draw_set_font(fName)
	draw_text(x, y + 180, $"{global.username} VS.{enemyname}")
}