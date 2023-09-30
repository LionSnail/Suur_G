extends Control

var opening_scene = load("res://Main/main.tscn.tscn")

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Main/main.tscn")
