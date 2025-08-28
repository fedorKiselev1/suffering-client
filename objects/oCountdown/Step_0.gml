reversecount = 4 - count

if count != count_prev {
	step = 0
	countdifference = abs(count - count_prev)
	if count < 4 && count > 0 {
		audio_play_sound(sndClock, 1, 0, 1, 0, (0.9 + reversecount * 0.1))
	}
	if count == 0 {
		audio_play_sound(sndBell, 1, 0, 1, 0, 1)
	}
}

var _pos = animcurve_channel_evaluate(progress, step)
var _posback = animcurve_channel_evaluate(back, step)

var _pospos = animcurve_channel_evaluate(back, positionstep)

if step < 1 {
	step += 1/15
} else {
	step = 1
}
if count != 4 {
	clockarmangleshown = 90 - (_pos * (90 / 4)) - (90 / 4 * reversecount) + 90 / 4
} else {
	clockarmangleshown = 90 - (90 / 4 * countdifference) + (_posback * (90 / 4)) * countdifference
}

count_prev = count

if global.shootoutactive {
	if positionstep < 1 {
		positionstep += 1/30
	} else {
		positionstep = 1
	}
} else {
	if positionstep > 0 {
		positionstep -= 1/30
	} else {
		positionstep = 0
	}
}

x = initialX - _pospos * 288