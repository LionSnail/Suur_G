extends Node
class_name Audio_

@export var menu_music_path: String = "event:/Music/MainMelody"
@export var game_music_path: String = "event:/Music/GameMainMelody"
@export var bad_ending_boom_path: String = "event:/SFX/Bang!"

@export var is_menu : bool

@export var click_sound: EventAsset

var instance: EventInstance

@export var is_beginning : bool


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


func clicker():
	FMODRuntime.play_one_shot(click_sound)
	return 

func stop_current():
	instance.stop(FMODStudioModule.FMOD_STUDIO_STOP_ALLOWFADEOUT)
	instance.release()
