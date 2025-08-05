if global.shootoutactive {
	if mouse_check_button_pressed(mb_left) {
		buffer_seek(oClient.client_buffer, buffer_seek_start, 0)
		buffer_write(oClient.client_buffer, buffer_u8, network.shoot)
		buffer_write(oClient.client_buffer, buffer_u16, mouse_x)
		buffer_write(oClient.client_buffer, buffer_u16, mouse_y)
		buffer_write(oClient.client_buffer, buffer_u16, oEnemy.x)
		buffer_write(oClient.client_buffer, buffer_u16, oEnemy.y)
		buffer_write(oClient.client_buffer, buffer_bool, position_meeting(mouse_x, mouse_y, oEnemy)) //shot?
		network_send_packet(oClient.client, oClient.client_buffer, buffer_tell(oClient.client_buffer))
		shootx = mouse_x
		shooty = mouse_y
		shotalpha = 1
	}
	
}
shotalpha -= 0.05
Enemyshotalpha -= 0.05