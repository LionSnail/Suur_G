extends Control

@export var menu_music_path: String = "event:/Music/MainMelody"
@export var game_music_path: String = "event:/Music/GameMainMelody"

var opening_scene = load("res://Main/main.tscn")
@onready var audio = $Node2D

func _on_start_pressed():
	audio.clicker()
	audio.fade_out_and_change_track(game_music_path)
	get_tree().change_scene_to_file("res://Main/main.tscn")



func _on_settings_pressed():
	audio.clicker()
	$CenterContainer/HBoxContainer.visible = false
	$Settings.visible = true


func _on_quit_pressed():
	audio.clicker()
	get_tree().quit()


func _on_done_pressed():
	audio.clicker()
	$CenterContainer/HBoxContainer.visible = true
	$Settings.visible = false



func _on_h_slider_sfx_value_changed(value):
	$AudioBusInit.change_volume(value, "sfx")


func _on_h_slider_music_value_changed(value):
	$AudioBusInit.change_volume(value, "music")
