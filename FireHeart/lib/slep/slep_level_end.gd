extends SlepBase
class_name SlepLevelEnd

func trigger() -> void:
	SignalBus.level_completed.emit()
	finish()
