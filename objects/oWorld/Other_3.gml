ini_open("volume_settings.ini")
ini_write_real("sound", "sfx", global.sfxvolume)
ini_write_real("sound", "bgm", global.bgmvolume)
ini_close()