extends Node2D




func end_game(ending):
	# ending 1, aliens destroy ship
	
	
	
	# ending 2, 3min has passed and you win!
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("esc"):
		get_tree().paused = true
		get_node("Spaceship/CanvasLayer/Pause").visible = true
