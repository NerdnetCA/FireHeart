extends CharacterBody2D

@export var shot_speed = Vector2(0,-720)
@export var power : int = 1

func _ready() -> void:
	velocity = shot_speed
	
func _physics_process(delta: float) -> void:
	var coll = move_and_collide(velocity * delta)
	if position.y < -10:
		expire()
	if coll:
		var target = coll.get_collider()
		_splash_at(target)
		if target.is_in_group(&"enemy"):
			(target as Enemy).damaged.emit(power)
		if target.is_in_group(&"obstacle"):
			pass
		expire()
	
func expire() -> void:
	queue_free()

func _splash_at(target) -> void:
	pass
