draw_self()
for (var i = 0; i < 2; i++) {
	draw_sprite_ext(sMenuspike, 0, x + lengthdir_x(sprite_width * (i + 1), image_angle), y + lengthdir_y(sprite_width * (i + 1), image_angle), 1, 1, image_angle, c_white, 1)
}