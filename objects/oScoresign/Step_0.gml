if hide {
	if hidestep < 51 {
		hidestep++
	}
} else {
	if hidestep > 0 {
		hidestep--
	}
}

y = initY - hidestep

if instance_exists(oEnemyClient) && !flag {
	alarm[0] = 120
	flag = true
}