extends Player

@export var bullet_scene : PackedScene

@onready var fire_timer := $FireTimer as Timer
@onready var state_chart := $StateChart as StateChart

func _ready() -> void:
	SignalBus.player_fire_on.connect(_on_player_fire_on)
	SignalBus.player_fire_off.connect(_on_player_fire_off)
	
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	
func _on_alive_state_physics_processing(_delta: float) -> void:
	velocity = lerp(velocity,control_vector,0.5)
	move_and_slide()
	for i in get_slide_collision_count():
		var collision := get_slide_collision(i)
		var collider := collision.get_collider()
		if collider.is_in_group("enemy"):
			(collider as Enemy).player_collided.emit()
			fatal_collision()
			
func fatal_collision() -> void:
	state_chart.send_event("was_hit")
	
func _on_fire_timer_timeout() -> void:
	var bullet = bullet_scene.instantiate()
	bullet.position = global_position
	get_parent().add_child(bullet)

func _on_player_fire_on() -> void:
	fire_timer.start()
func _on_player_fire_off() -> void:
	fire_timer.stop()

func guns_on(guns : bool) -> void:
	if guns:
		fire_timer.start()
	else:
		fire_timer.stop()
		
func _on_dead_state_entered() -> void:
	collider_on(false)
	guns_on(false)
	
func _on_alive_state_entered() -> void:
	collider_on(true)

func _on_spawn_state_entered() -> void:
	position = Vector2(320, 900)
	var tween = create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.tween_property(self, "position", Vector2(320,600), 2.0)
	tween.chain().tween_callback(func(): state_chart.send_event(&"revive"))
