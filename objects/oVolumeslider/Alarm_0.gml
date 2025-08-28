ini_open("volume_settings.ini")
if type = "sfx" {
	x += ini_read_real("sound", "sfx", 20) * 60
}
if type = "bgm" {
	x += ini_read_real("sound", "bgm", 20) * 60
}
ini_close()