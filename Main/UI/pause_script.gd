extends Control


func _on_resume_pressed():
	AudioSingleton.clicker()
	get_tree().paused = false
	self.visible = false


func _on_quit_pressed():
	AudioSingleton.clicker()
	await  get_tree().create_timer(0.2).timeout
	get_tree().quit()


func _on_restart_pressed():
	var start = "res://Main/UI/main_menu/main_menu.tscn"
	
	get_tree().change_scene_to_file(start)
