if dodgeroll == false && dodgerollcooldown <= 0 && keyboard_check(ord("D")) - keyboard_check(ord("A")) != 0 && global.shootoutactive {
	dodgeroll = true
	dodgedirection = keyboard_check(ord("D")) - keyboard_check(ord("A"))
	rolldestination = x + dodgedirection * 200
	camera_set_view_angle(view_camera[0], dodgedirection * -1)
	camera_set_view_size(view_camera[0], camera_get_view_width(view_camera[0]) - 8, camera_get_view_height(view_camera[0]) - 8)
	oWorld.dodgerolling = true
	oFpshand.readytoshoot = false
}

	