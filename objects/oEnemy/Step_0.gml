if instance_exists(oEnemyClient) {
	//x = lerp(x, (oEnemyClient.x - oPlayerClient.x) / 3 + room_width / 2, 0.2)
	enemylerp = lerp(enemylerp, oEnemyClient.x, 0.2)
	x = (enemylerp - oPlayerClient.x) / 3 + room_width / 2
	visible = true
} else {
	visible = false
}

headshot.x = x
headshot.y = y - 10

if sprite_index = sEnemy {
	animtimer--
	if animtimer <= 0 {
		animtimer = 12
		image_index++
	}
}
if image_index % 2 == 0 {
	headshot.y = y - 11
}