extends Node2D

@onready var bad_ending = "res://Main/Enviroment/bad_ending.tscn"
@onready var good_ending = "res://Main/Enviroment/good_ending.tscn"


func end_game(ending):
	# ending 1, aliens destroy ship
	$Fade_manager.fade_out()
	await get_tree().create_timer(1).timeout
	if ending == 1:
		get_tree().change_scene_to_file(bad_ending)
	
	# ending 2, 3min has passed and you win!
	if ending == 2:
		get_tree().change_scene_to_file(good_ending)
		

func _physics_process(delta):
	if Input.is_action_just_pressed("esc"):
		get_tree().paused = true
		get_node("Spaceship/CanvasLayer/Pause").visible = true
