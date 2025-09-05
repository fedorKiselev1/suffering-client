if canmove && !dodgeroll {
	var _direction = keyboard_check(ord("D")) - keyboard_check(ord("A"))

	x = clamp(x + _direction * 4, 0, room_width)

	if _direction != 0 {
		buffer_seek(oClient.client_buffer, buffer_seek_start, 0)
		buffer_write(oClient.client_buffer, buffer_u8, network.move)
		buffer_write(oClient.client_buffer, buffer_u16, x)
		network_send_packet(oClient.client, oClient.client_buffer, buffer_tell(oClient.client_buffer))
	}
}
if instance_exists(oCountdown) {
	oCountdown.playerscore = playerscore
}

if dodgeroll {
	dodgerollcooldown = 60
	x = clamp(lerp(x, rolldestination, 0.2), 0, room_width)
	
	buffer_seek(oClient.client_buffer, buffer_seek_start, 0)
	buffer_write(oClient.client_buffer, buffer_u8, network.move)
	buffer_write(oClient.client_buffer, buffer_u16, x)
	network_send_packet(oClient.client, oClient.client_buffer, buffer_tell(oClient.client_buffer))
	if dodgerollduration == 20 {
		repeat(20) {
			part_type_direction(global.speedline, (dodgedirection ? 180 : 0), (dodgedirection ? 180 : 0), 0, 0)
			part_particles_create(global.particleSYS,(dodgedirection ? room_width + 100 : 0 - 100), random_range(0, room_height), global.speedline, 1)
		}
		
	}
	
	camera_set_view_angle(view_camera[0], lerp(camera_get_view_angle(view_camera[0]), 0, 0.2))
	camera_set_view_size(view_camera[0], lerp(camera_get_view_width(view_camera[0]), 960, 0.2), lerp(camera_get_view_height(view_camera[0]), 540, 0.2))
	
	
	
	dodgerollduration--
	if dodgerollduration <= 0 {
		if global.shootoutactive && oWorld.reloaded oFpshand.readytoshoot = true
		dodgeroll = false
		dodgerollduration = 20
		oWorld.dodgerolling = false
	}
}

if dodgerollcooldown > 0 {
	oWorld.dodgerollcooldown = dodgerollcooldown
	dodgerollcooldown--
}

if x < 100 {
	oWorld.drawedgeL = true
	oWorld.drawedgeLalpha = 1 - x / 100
} else {
	oWorld.drawedgeL = false
}

if x > room_width - 100 {
	oWorld.drawedgeR = true
	oWorld.drawedgeRalpha = (x - room_width + 100) / 100
} else {
	oWorld.drawedgeR = false
}