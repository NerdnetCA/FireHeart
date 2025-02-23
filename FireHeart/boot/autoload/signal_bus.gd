extends Node

signal screen_change(next_screen : String)

## Level/Stage signals
signal patrol_spawned(enemy: Node2D, patrol_name : StringName)
signal effect_spawned(effect: Node2D)
signal level_completed

## Player signals
signal player_fire_on
signal player_fire_off
