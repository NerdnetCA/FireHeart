extends SlepBase
class_name SlepPlayerFire

@export var fire_state : bool

func trigger() -> void:
	if fire_state:
		SignalBus.player_fire_on.emit()
	else:
		SignalBus.player_fire_off.emit()
	finish()
