if global.shootoutactive {
	if reloaded && !dodgerolling {
		if mouse_check_button_pressed(mb_left) {
			audio_play_sound(sndGun, 2, 0)
			buffer_seek(oClient.client_buffer, buffer_seek_start, 0)
			buffer_write(oClient.client_buffer, buffer_u8, network.shoot)
			buffer_write(oClient.client_buffer, buffer_u16, mouse_x)
			buffer_write(oClient.client_buffer, buffer_u16, mouse_y)
			buffer_write(oClient.client_buffer, buffer_u16, oEnemy.x)
			buffer_write(oClient.client_buffer, buffer_u16, oEnemy.y)
			buffer_write(oClient.client_buffer, buffer_bool, position_meeting(mouse_x, mouse_y, oEnemy)) //shot?
			buffer_write(oClient.client_buffer, buffer_bool, position_meeting(mouse_x, mouse_y, oEnemyHead)) //headshot?
			network_send_packet(oClient.client, oClient.client_buffer, buffer_tell(oClient.client_buffer))
			if position_meeting(mouse_x, mouse_y, oEnemy) {
				instance_create_layer(mouse_x, mouse_y, "ready", oDamageindicator)
			}
			shootx = mouse_x
			shooty = mouse_y
			shotalpha = 1
			reloaded = false
			reloadtime = reloadtimemax
			scopeeffect = 1
		}
	}
}
if Enemyshotalpha == 1 {
	audio_play_sound(choose(sndBulletmiss1, sndBulletmiss2, sndBulletmiss3), 1, 0, 2, 0, random_range(0.9, 1.1))
}
shotalpha -= 0.05
Enemyshotalpha -= 0.05

scopeeffect = lerp(scopeeffect, 0, 0.2)


if !reloaded && global.shootoutactive {
	if position_meeting(mouse_x, mouse_y, oReadyzone) {
		if reloadtime > 0 {
			reloadtime -= reloadtimemax / 25
		} else {
			reloaded = true
			oFpshand.readytoshoot = true
		}
	} else {
		if reloadtime < reloadtimemax {
			reloadtime++	
		}
	}
}

if room == rClient {
	audio_stop_sound(menusnd)
	if global.shootoutactive {
		if preshootout {
			preshootout = false
			sndshootout = audio_play_sound(sndShootout, 1, 1)
		} 
		audio_sound_gain(sndshootout, 1, 500)
	} else {
		if audio_sound_is_playable(sndshootout) {
			audio_sound_gain(sndshootout, 0.2, 500)
		}
	}
}

if deathflash {
	deathsflashalpha -= 0.05
	if deathsflashalpha <= 0 {
		deathflash = false
	}
} else {
	deathsflashalpha = maxdeathsflashalpha
}