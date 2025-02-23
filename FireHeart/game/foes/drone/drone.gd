extends Enemy

@export var drone_type : Drone

@onready var sprite := $Sprite2D as Sprite2D
@onready var anim_player := $AnimationPlayer as AnimationPlayer

const explosion_pack := preload("res://game/comp/explosion.tscn")

var heading : Vector2
var hp : int

func _ready() -> void:
	sprite.texture = drone_type.sprite_sheet
	var oid = create_shape_owner(self)
	shape_owner_add_shape(oid,drone_type.collider)
	heading = Vector2(1,0)
	hp = drone_type.hitpoints
	
func _physics_process(delta: float) -> void:
	pass

func _on_damaged(incoming_damage: int) -> void:
	anim_player.play(&"hit")
	hp -= 1
	if hp <= 0:
		explode()

func explode() -> void:
	var splo := explosion_pack.instantiate() as Node2D
	splo.position = global_position
	SignalBus.effect_spawned.emit(splo)
	destroyed.emit()
	
func _on_destroyed() -> void:
	queue_free()

func _on_player_collided() -> void:
	explode()
	
