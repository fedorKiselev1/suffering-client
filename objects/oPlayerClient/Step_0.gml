var _direction = keyboard_check(ord("D")) - keyboard_check(ord("A"))


if _direction != 0 {
	buffer_seek(oClient.client_buffer, buffer_seek_start, 0)
	buffer_write(oClient.client_buffer, buffer_u8, network.move)
	buffer_write(oClient.client_buffer, buffer_u16, x + _direction * 4)
	network_send_packet(oClient.client, oClient.client_buffer, buffer_tell(oClient.client_buffer))
}