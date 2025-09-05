if instance_exists(oEnemyClient) {
	//x = lerp(x, (oEnemyClient.x - oPlayerClient.x) / 3 + room_width / 2, 0.2)
	enemylerp = lerp(enemylerp, oEnemyClient.x, 0.2)
	x = (enemylerp - oPlayerClient.x) / 3 + room_width / 2
	visible = true
} else {
	visible = false
}