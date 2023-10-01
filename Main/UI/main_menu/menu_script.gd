extends Control

var opening_scene = load("res://Main/main.tscn")

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Main/main.tscn")



func _on_settings_pressed():
	$CenterContainer/HBoxContainer.visible = false
	$CenterContainer/HBoxContainer/VBoxContainer/Settings.visible = true


func _on_quit_pressed():
	get_tree().quit()


func _on_h_slider_value_changed(value):
	pass # Replace with function body.


func _on_done_pressed():
	$CenterContainer/HBoxContainer.visible = false
	$CenterContainer/HBoxContainer/VBoxContainer/Settings.visible = true

