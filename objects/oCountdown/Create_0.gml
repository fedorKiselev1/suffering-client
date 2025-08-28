count = 4
count_prev = count
clockarmangle = (90 / 4 * count)

reversecount = 0
countdifference = 0

progress = animcurve_get_channel(acClockmovement, "progress")
back = animcurve_get_channel(acClockmovement, "back")
step = 1

clockarmangleshown = 0

positionstep = 0

initialX = x
initialY = y

playerscore = 0
enemyscore = 0
enemyname = ""