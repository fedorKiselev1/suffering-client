function recieved_packet(argument0) {
	buffer = argument0
	msgid = buffer_read(buffer, buffer_u8)
	
	switch(msgid) {
		
		case network.player_establish:
			var _socket = buffer_read(buffer, buffer_u8)
			global.mysocket = _socket
			
			buffer_seek(client_buffer, buffer_seek_start, 0)
			buffer_write(client_buffer, buffer_u8, network.player_establish)
			buffer_write(client_buffer, buffer_string, "GAMER") //change this
			network_send_packet(client, client_buffer, buffer_tell(client_buffer))
			
			break;
		
		case network.player_connect:
			var _socket = buffer_read(buffer, buffer_u8)
			var _x = buffer_read(buffer, buffer_u16)
			var _y = buffer_read(buffer, buffer_u16)
			var _username = buffer_read(buffer, buffer_string)
			
			var _player = instance_create_depth(_x, _y, depth, oPlayerClient)
			_player.socket = _socket
			_player.username = _username
			
			ds_map_add(socket_to_instance_id, _socket, _player)
			break;
		
		case network.player_joined:
			var _socket = buffer_read(buffer, buffer_u8)
			var _x = buffer_read(buffer, buffer_u16)
			var _y = buffer_read(buffer, buffer_u16)
			var _username = buffer_read(buffer, buffer_string)
			
			var _enemy = instance_create_depth(_x, _y, depth, oEnemyClient)
			_enemy.socket = _socket
			_enemy.username = _username
			
			ds_map_add(socket_to_instance_id, _socket, _enemy)
			break;
			
		case network.player_disconnect:
			var _socket = buffer_read(buffer, buffer_u8)
			var _player = ds_map_find_value(socket_to_instance_id, _socket)
			
			with (_player) {
				instance_destroy()
			}
			
			ds_map_delete(socket_to_instance_id, _socket)
			
			break;
		
		case network.move:
			var _sock = buffer_read(buffer, buffer_u8)
			var mov_x = buffer_read(buffer, buffer_u16)
			
			_player = ds_map_find_value(socket_to_instance_id, _sock)
			
			_player.x = mov_x
			break;
			
		case network.ready_position:
			var _sock = buffer_read(buffer, buffer_u8)
			var _ready = buffer_read(buffer, buffer_bool)
			
			_player = ds_map_find_value(socket_to_instance_id, _sock)
			
			_player.ready = _ready
			break;
			
		case network.countdown:
			var _count = buffer_read(buffer, buffer_u8)
			oCountdown.count = _count
			if _count == 0 {
				global.shootoutactive = true
			} else {
				global.shootoutactive = false
			}
			break;
		case network.shoot:
			var _sock = buffer_read(buffer, buffer_u8)
			var _shotX = buffer_read(buffer, buffer_u16)
			var _shotY = buffer_read(buffer, buffer_u16)
			var _victimX = buffer_read(buffer, buffer_u16)
			var _victimY = buffer_read(buffer, buffer_u16)
			var _hit = buffer_read(buffer, buffer_bool)
			var _score = buffer_read(buffer, buffer_u16)
			
			if _sock = global.mysocket {
				if _hit {
					oEnemy.image_angle = 180
				}
			} else {
				oWorld.Enemyshootx = _shotX
				oWorld.Enemyshooty = _shotY
				oWorld.Enemyvictimx = _victimX
				oWorld.Enemyvictimy = _victimY
				oWorld.Enemyshotalpha = 1
			}
			
			_player = ds_map_find_value(socket_to_instance_id, _sock)
			break;
			
	}
}