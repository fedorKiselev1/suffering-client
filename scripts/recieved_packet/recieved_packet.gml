function recieved_packet(argument0) {
	buffer = argument0
	msgid = buffer_read(buffer, buffer_u8)
	
	switch(msgid) {
		
		case network.player_establish:
			var _socket = buffer_read(buffer, buffer_u8)
			global.mysocket = _socket
			
			buffer_seek(client_buffer, buffer_seek_start, 0)
			buffer_write(client_buffer, buffer_u8, network.player_establish)
			buffer_write(client_buffer, buffer_string, global.username)
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
			
			oPlayerClient.playerscore = 0
			
			break;
		
		case network.move:
			var _forced = buffer_read(buffer, buffer_bool)
			var _sock = buffer_read(buffer, buffer_u8)
			var mov_x = buffer_read(buffer, buffer_u16)
			
			_player = ds_map_find_value(socket_to_instance_id, _sock)
			
			if _sock != global.mysocket || _forced {
				_player.x = mov_x
			}
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
				oFpshand.readytoshoot = true
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
					global.shootoutactive = false
					oEnemy.sprite_index = sEnemydead
					audio_play_sound(sndHit, 1, 0)
					instance_create_layer(room_width, 0, "transition", oTransition)
				}
			} else if !_hit {
				oWorld.Enemyshootx = _shotX
				oWorld.Enemyshooty = _shotY
				oWorld.Enemyvictimx = _victimX
				oWorld.Enemyvictimy = _victimY
				oWorld.Enemyshotalpha = 1
				
			} else {
				oFpshand.image_index = 1
				oFpshand.alarm[0] = 20
				oFpshand.shake = true
				oPlayerClient.canmove = false
				instance_create_layer(736, 224, "ready", oDeath)
				global.shootoutactive = false
				audio_play_sound(sndDeath, 1, 0, 1.5)
				instance_create_layer(room_width, 0, "transition", oTransition)
				oWorld.deathflash = true
			}
			
			_player = ds_map_find_value(socket_to_instance_id, _sock)
			_player.playerscore = _score
			break;
			
		case network.reset:
			if instance_exists(oTransition) {
				oTransition.active = false
			}
			oEnemy.sprite_index = sEnemy
			oEnemy.image_speed = 1
			oReadyzone.image_alpha = 1
			oPlayerClient.canmove = true
			oWorld.reloadtime = 0
			oWorld.reloaded = true
			oFpshand.readytoshoot = false
			oFpshand.image_index = 0
			with (oDeath) {
				instance_destroy()
			}
			break;
	}
}