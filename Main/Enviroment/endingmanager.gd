extends Node2D

@export var bad_ending_boom_path: String = "event:/SFX/Bang!"
var good_ending_music: String = "event:/Music/GoodEnding"
var bad_ending_music: String = "event:/Music/BadEnding"

func _ready():
	if name == "Bad_ending":
		$Fade_manager.fade_in_long()
		AudioSingleton.fade_out_and_change_track(bad_ending_boom_path)
		await get_tree().create_timer(3.3).timeout
		AudioSingleton.fade_out_and_change_track(bad_ending_music)
	
	if name == "Good_ending":
		print(name)
		$Fade_manager.fade_in_long()
		AudioSingleton.fade_out_and_change_track(good_ending_music)
