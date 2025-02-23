extends Node

const default_screen := "menu"

@onready var container := $ScreenContainer as Node
@onready var blackout := $CanvasLayer/ColorRect as ColorRect
@onready var layer := $CanvasLayer as CanvasLayer

var target_screen : String

func _ready() -> void:
	SignalBus.screen_change.connect(to_screen)
	to_screen(default_screen)
	
func to_screen(next_screen : String) -> void:
	get_tree().paused = true
	target_screen = next_screen
	layer.visible = true
	var tw = create_tween()
	tw.tween_property(blackout, "modulate:a", 1.0, 0.6)
	tw.chain().tween_callback(_load_screen)

func _load_screen() -> void:
	var scene := Wrangler.find_screen(target_screen)
	if !scene:
		print("MAIN: cannot find requested screen - %s"%[target_screen])
		return
	var screen := scene.instantiate()
	for n in container.get_children():
		n.queue_free()
	container.add_child(screen)
	
	var tw = create_tween()
	tw.tween_property(blackout, "modulate:a", 0.0, 0.6)
	tw.chain().tween_callback(_resume)
	
func _resume() -> void:
	layer.visible = false
	get_tree().paused = false
