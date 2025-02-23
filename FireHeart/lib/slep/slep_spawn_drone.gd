extends SlepBase
class_name SlepSpawnDrone

@export var patrol_name : StringName
@export var drone_variant : Drone

var drone_scene = preload("res://game/foes/drone/drone.tscn")

func _spawn() -> void:
	var new_drone = drone_scene.instantiate()
	new_drone.drone_type = drone_variant
	SignalBus.patrol_spawned.emit(new_drone, patrol_name)
	
func trigger() -> void:
	_spawn()
	await get_tree().create_timer(0.3).timeout
	_spawn()
	await get_tree().create_timer(0.3).timeout
	_spawn()
	await get_tree().create_timer(0.3).timeout
	_spawn()
	await get_tree().create_timer(0.3).timeout
	_spawn()
	finish()
