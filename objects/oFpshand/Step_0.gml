if readytoshoot {
	image_angle = lerp(image_angle, point_direction(x, y, mouse_x, mouse_y) / 4 - 30, 0.08)
	x = lerp(x, initX + (mouse_x - room_width / 2) / 10, 0.15)
	y = lerp(y, initY + (mouse_y - room_height / 2) / 10, 0.15)
} else {
	image_angle = lerp(image_angle, 30, 0.15)
	y = lerp(y, room_height + 150, 0.15)
}

if shake {
	x += random_range(-3, 3)
	y += random_range(-3, 3)
	shaketimer--
	if shaketimer <= 0 {
		shake = false
	}
} else {
	shaketimer = 60
}