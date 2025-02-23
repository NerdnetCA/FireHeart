extends Node2D

func _ready() -> void:
	var dir := DirAccess.open("res://world/")
	dir.list_dir_begin()
	var file_name := dir.get_next()
	while file_name != "":
		if dir.current_is_dir():
			print("Dir %s"%file_name)
		else:
			print("FILE: %s"%file_name)
		file_name = dir.get_next()
