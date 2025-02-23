extends Node

const SCREENS_PATH : String = "res://screens"

var screens : Array[String] = []

func find_screen(screen_name : String) -> PackedScene:
	var rc : PackedScene
	if screens.has(screen_name):
		rc = load("%s/%s/%s.tscn"%[SCREENS_PATH,screen_name,screen_name])
	return rc

func _ready() -> void:
	_enumerate_screens()
	
func _enumerate_screens() -> void:
	var dir := DirAccess.open(SCREENS_PATH)
	if !dir:
		print("WRANGLER: cannot open screens folder at %s"%SCREENS_PATH)
		return
	dir.list_dir_begin()
	var file_name := dir.get_next()
	while file_name != "":
		if dir.current_is_dir():
			print("WRANGLER: Adding screen - " + file_name)
			screens.append(file_name)
		file_name = dir.get_next()
