extends Node2D

var menu_music_path: String = "event:/Music/MainMelody"
var game_music_path: String = "event:/Music/GameMainMelody"
var bad_ending_boom_path: String = "event:/SFX/Bang!"

var click_sound: String = "event:/UI/Click"

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


func clicker():
	FMODRuntime.play_one_shot_path(click_sound)
	return 

func stop_current():
	instance.stop(FMODStudioModule.FMOD_STUDIO_STOP_ALLOWFADEOUT)
	instance.release()
