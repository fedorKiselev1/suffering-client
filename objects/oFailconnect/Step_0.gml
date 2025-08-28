if alpha > 0 {
	alpha -= 0.003
}
if global.failedtoconnect {
	global.failedtoconnect = false
	alpha = 1
}