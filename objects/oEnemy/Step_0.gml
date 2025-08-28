if instance_exists(oEnemyClient) {
	x = lerp(x, (oEnemyClient.x - oPlayerClient.x) / 3 + room_width / 2, 0.2)
	visible = true
} else {
	visible = false
}