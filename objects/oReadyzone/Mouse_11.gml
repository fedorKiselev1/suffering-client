buffer_seek(oClient.client_buffer, buffer_seek_start, 0)
buffer_write(oClient.client_buffer, buffer_u8, network.ready_position)
buffer_write(oClient.client_buffer, buffer_bool, false)
network_send_packet(oClient.client, oClient.client_buffer, buffer_tell(oClient.client_buffer))