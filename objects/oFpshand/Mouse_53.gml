if global.shootoutactive {
	if oWorld.reloaded && !oWorld.dodgerolling {
		if oWorld.reloaded {
			oWorld.shootX1 = x + lengthdir_x(92 * 2, image_angle + 135) + lengthdir_x(6, image_angle + 135 + 90)
			oWorld.shootY1 = y + lengthdir_y(92 * 2, image_angle + 135) + lengthdir_y(6, image_angle + 135 + 90)
			oWorld.shootX2 = x + lengthdir_x(92 * 2, image_angle + 135) + lengthdir_x(6, image_angle + 135 - 90)
			oWorld.shootY2 = y + lengthdir_y(92 * 2, image_angle + 135) + lengthdir_y(6, image_angle + 135 - 90)
			instance_create_layer(x - 140, y - 140, "muzzle", oMuzzle)
			image_angle = -60
			alarm[0] = 15
		}
	}
}