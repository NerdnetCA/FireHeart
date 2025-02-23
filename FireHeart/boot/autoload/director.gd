extends Node

var cues_unclaimed : Array[StringName] = []
var cues_claimed : Dictionary = {}

func clear() -> void:
	cues_unclaimed = []
	cues_claimed = {}

func cue(cue_name : StringName) -> void:
	if cues_claimed.has(cue_name):
		var callable := cues_claimed[cue_name] as Callable
		cues_claimed.erase(cue_name)
		callable.call()
	else:
		cues_unclaimed.append(cue_name)
	
func take_cue(cue_name : StringName, callable : Callable) -> void:
	if cues_unclaimed.has(cue_name):
		cues_unclaimed.erase(cue_name)
		callable.call()
	else:
		cues_claimed[cue_name] = callable
