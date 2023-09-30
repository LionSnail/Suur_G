extends Node2D

@export var event: EventAsset
var instance: EventInstance

func _ready():
	instance = FMODRuntime.create_instance_path("event:/Music/MainMelody")
	instance.start()

func _input(input_event):
	if input_event is InputEventKey and input_event.pressed:
		if input_event.keycode == KEY_S:
			instance.stop(FMODStudioModule.FMOD_STUDIO_STOP_ALLOWFADEOUT)
			instance.release()
