if position_meeting(mouse_x, mouse_y, self) {
	if mouse_check_button_pressed(mb_left) {
		moving = true
	}
}
if mouse_check_button_released(mb_left) {
	moving = false
}

if moving {
	x = clamp(mouse_x, initX, initX + 120)
	if type = "sfx" {
		sfxtimer--
		if sfxtimer <= 0 {
			sfxtimer = 40
			audio_play_sound(sndClock, 1, 0)
		}
	}
}

audio_group_set_gain(type = "bgm" ? bgm : sfx, (x - initX) / 60, 0)

if type = "sfx" {
	global.sfxvolume = (x - initX) / 60
}
if type = "bgm" {
	global.bgmvolume = (x - initX) / 60
}