extends CanvasLayer

enum Caption { NONE, OVER, READY }

@export var lives : int = 3 :
	set(val):
		if val != lives:
			lives = val
			_update_lives()

@export var power : float = 0.0 :
	set(val):
		if val != power:
			power = val
			_update_power()

@export var caption : Caption = Caption.NONE :
	set(val):
		if val != caption:
			caption = val
			_update_caption()

@onready var caption_over := $LabelGameOver as Label
@onready var caption_ready := $LabelReady as Label


func _ready() -> void:
	pass
	
	
func _update_lives() -> void:
	pass
	
func _update_power() -> void:
	pass
	
func _update_caption() -> void:
	match caption:
		Caption.NONE:
			caption_over.visible = false
			caption_ready.visible = false
		Caption.OVER:
			caption_over.visible = true
			caption_ready.visible = false
		Caption.READY:
			caption_over.visible = false
			caption_ready.visible = true
			
	
