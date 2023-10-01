extends Node2D

@export var bad_ending_boom_path: String = "event:/SFX/Bang!"

func _ready():
	if name == "Bad_ending":
		$Fade_manager.fade_in_long()
		AudioSingleton.fade_out_and_change_track(bad_ending_boom_path)
