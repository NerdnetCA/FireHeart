extends Node

@export var game_stage : GameStage

signal drone_spawned(drone: Node2D, patrol : String)


var tick_delay : int = 1

@onready var timer := $Timer as Timer

func start() -> void:
	timer.start()
	
func _on_timer_timeout() -> void:
	tick_delay -= 1
	if tick_delay <= 0:
		_do_tick()
	else:
		timer.start()

func _do_tick() -> void:
	if get_child_count() <= 1:
		return
	var slep := get_children()[1] as SlepBase
	if !slep:
		return
	print("SLEP -  ", slep)
	tick_delay = slep.cooldown_ticks
	slep.call_deferred("trigger")
	await slep.finished
	remove_child(slep)
	if tick_delay <= 0:
		_do_tick()
	else:
		timer.start()
