/*
ini_open("volume_settings.ini")
if type = "sfx" {
	x += ini_read_real("sound", "sfx", 20 / 60) * 60
}
if type = "bgm" {
	x += ini_read_real("sound", "bgm", 20 / 60) * 60
}
ini_close()
*/
try {
	var buf = buffer_load("game_settings.ini")
	var text = buffer_read(buf, buffer_string)
	text = string_split(text, "\n", 1)
	for (var i = 0; i < array_length(text); i++) {
		if type = "sfx" {
			if string_pos("sfx:", text[i]) {
				x += clamp(real(string_trim(string_copy(text[i], 5, string_length(text[i]) - 4))) * 60, 0, 120)
			}
		}
		if type = "bgm" {
			if string_pos("bgm:", text[i]) {
				x += clamp(real(string_trim(string_copy(text[i], 5, string_length(text[i]) - 4))) * 60, 0, 120)
			}
		}
	}
} catch(e) {
	x += 20	
}