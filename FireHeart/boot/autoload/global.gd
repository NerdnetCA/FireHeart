extends Node

const GAME_TITLE := "FireHeart"

const DEFAULT_LIVES = 3

var lives : int = DEFAULT_LIVES
var score : int = 0


func new_game() -> void:
	lives = DEFAULT_LIVES
	score = 0
	
