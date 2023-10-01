extends Node2D
class_name Audio_

@export var menu_music_path: String = "event:/Music/MainMelody"
@export var game_music_path: String = "event:/Music/GameMainMelody"

var instance: EventInstance

func _ready():
	instance = FMODRuntime.create_instance_path(menu_music_path)
	instance.start()
	

# Function to change the music track.
func change_track(new_track_path: String):
	instance.stop(FMODStudioModule.FMOD_STUDIO_STOP_IMMEDIATE)
	instance.release()
	instance = FMODRuntime.create_instance_path(new_track_path)
	instance.start()
	

# Function to fade out and change the track.
func fade_out_and_change_track(new_track_path: String):
	instance.stop(FMODStudioModule.FMOD_STUDIO_STOP_ALLOWFADEOUT)
	change_track(new_track_path)
