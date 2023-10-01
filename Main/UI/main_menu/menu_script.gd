extends Control

@export var menu_music_path: String = "event:/Music/MainMelody"
@export var game_music_path: String = "event:/Music/GameMainMelody"

var opening_scene = load("res://Main/main.tscn")
@onready var audio = $Node2D

func _ready():
	AudioSingleton.fade_out_and_change_track(menu_music_path)
	


func _on_start_pressed():
	AudioSingleton.clicker()
	await  get_tree().create_timer(0.01).timeout
	$Fade_manager.fade_out()
	await get_tree().create_timer(1).timeout
	
	
	AudioSingleton.fade_out_and_change_track(game_music_path)
	await get_tree().create_timer(0.01).timeout
	
	var x = get_parent().get_node("./Main Menu")
	print(x)
	get_tree().change_scene_to_file("res://Main/main.tscn")



func _on_settings_pressed():
	AudioSingleton.clicker()
	$CenterContainer/HBoxContainer.visible = false
	$Settings.visible = true


func _on_quit_pressed():
	AudioSingleton.clicker()
	await  get_tree().create_timer(0.2).timeout
	get_tree().quit()


func _on_done_pressed():
	AudioSingleton.clicker()
	$CenterContainer/HBoxContainer.visible = true
	$Settings.visible = false



func _on_h_slider_sfx_value_changed(value):
	$AudioBusInit.change_volume(value, "sfx")


func _on_h_slider_music_value_changed(value):
	$AudioBusInit.change_volume(value, "music")

func manage_audio():
	pass

