extends Node
class_name GameStage

@onready var patrol_list := $Patrols as Node2D
@onready var spawn_list := $Spawns as Node2D
@onready var playfield := $PlayField as Node2D

const bounds_pack = preload("res://screens/game/comp/bounds.tscn")

func _ready() -> void:
	var bounds = bounds_pack.instantiate()
	add_child(bounds)
	SignalBus.patrol_spawned.connect(_on_patrol_spawned)
	SignalBus.effect_spawned.connect(_on_effect_spawned)
	$SlepProcessor.start()
	
func _on_effect_spawned(effect: Node2D) -> void:
	playfield.add_child(effect)
	
func _on_patrol_spawned(enemy: Node2D, patrol: StringName) -> void:
	var path = patrol_list.find_child(patrol) as Path2D
	var patroller = Patroller.new()
	patroller.speed = enemy.drone_type.speed
	patroller.add_child(enemy)
	path.add_child(patroller)
	
