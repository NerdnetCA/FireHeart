extends PathFollow2D
class_name Patroller

@export var speed : float

func _ready() -> void:
	var path := get_parent() as Path2D
	var len := path.curve.get_baked_length()
	print(len)
	var t := create_tween()
	t.tween_property(self, "progress_ratio", 1.0, len/speed)
	t.chain().tween_callback(func(): queue_free())
