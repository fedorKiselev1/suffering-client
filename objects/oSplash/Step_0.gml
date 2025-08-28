image_alpha += 0.02
if image_alpha = 0.80 {
	audio_play_sound(sndsplash, 1, 0)
}
if image_alpha > 4 {
	room_goto(rMenu)
}