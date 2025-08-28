if instance_exists(oCountdown) {
	oCountdown.enemyscore = playerscore
}
if instance_exists(oEnemy) {
	oEnemy.ready = ready
}
if username != "" {
	if instance_exists(oCountdown) {
		oCountdown.enemyname = username
	}
}