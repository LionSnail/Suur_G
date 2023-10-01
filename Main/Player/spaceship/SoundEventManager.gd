extends Node2D

@export var oxygen_sound: EventAsset
@export var engine_sound: EventAsset

func play_sound(type):
	if type == "oxygen":
		FMODRuntime.play_one_shot(oxygen_sound, self)
	
	if type == "engine":
		FMODRuntime.play_one_shot(engine_sound, self)
