extends Node2D

signal finished

@onready var particles := $GPUParticles2D as GPUParticles2D

func _ready() -> void:
	trigger()
	
func trigger() -> void:
	particles.finished.connect(_on_particles_finished)
	particles.emitting = true
	
func _on_particles_finished() -> void:
	finished.emit()
	queue_free()
