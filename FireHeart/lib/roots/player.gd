extends CharacterBody2D
class_name Player

@export var speed := 350.0

signal was_hit

var control_vector := Vector2.ZERO

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	control_vector = direction.normalized() * speed

func collider_on(collide : bool) -> void:
	if collide:
		set_collision_layer_value(0,true)
		set_collision_mask_value(4,true)
		set_collision_mask_value(5,true)
	else:
		set_collision_layer_value(0,false)
		set_collision_mask_value(4,false)
		set_collision_mask_value(5,false)
