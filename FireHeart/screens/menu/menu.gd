extends Node


func _on_play_button_pressed() -> void:
	SignalBus.screen_change.emit("game")
