extends Node
class_name SlepBase

signal finished

@export var cooldown_ticks : int = 4

func _ready() -> void:
	pass
	
func trigger() -> void:
	print_rich("[color=red]WARNING:[/color] Slep trigger not overridden!")

func finish() -> void:
	finished.emit()
	queue_free()
