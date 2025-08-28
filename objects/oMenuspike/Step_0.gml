x = x - lengthdir_x(sprite_width / 300, image_angle)
y = y - lengthdir_y(sprite_width / 300, image_angle)
timer++
if timer >= 300 {
	x = initX
	y = initY
	timer = 0
}