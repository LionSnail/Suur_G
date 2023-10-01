extends Node2D

@export var oxygen_sound: EventAsset
@export var engine_sound: EventAsset
@export var hit_sound: EventAsset

func play_sound(type):
	if type == "oxygen" and oxygen_sound:
		FMODRuntime.play_one_shot(oxygen_sound, self)
	
	if type == "engine" and engine_sound:
		FMODRuntime.play_one_shot(engine_sound, self)
	
	if type == "hit" and hit_sound:
		FMODRuntime.play_one_shot(hit_sound, self)
