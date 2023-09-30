extends Node2D

@onready var vieport_size 

var oxy_amount = 100
var engine_amount = 100
var hp = 10
var current = ""

var difficulty = 0.1

func _ready():
	current = "Oxygen"

func _physics_process(delta):
	update_ui()
	
	
	difficulty += 0.0005

func flickering():
	$lights/PointLight2D.energy = randf_range(0.00, 0.2)

func click(current):
	match current:
		"Oxygen":
			oxy_amount = clamp(oxy_amount + 3, 0, 100)
			
			
		"Engine":
			engine_amount = clamp(engine_amount + 3, 0, 100)
			
		
	


func set_current(type):
	current = type
	for child in get_node("modules").get_children():
		if child.name != current:
			child.active = false

func screen_shake(force):
	force = 4 * pow(force, -1)
	$Camera2D.offset = Vector2(randi_range(-force, force), randi_range(-force, force))
	await  get_tree().create_timer(0.1).timeout
	$Camera2D.offset = Vector2(randi_range(-force, force), randi_range(-force, force))
	await  get_tree().create_timer(0.1).timeout
	$Camera2D.offset = Vector2(randi_range(-force, force), randi_range(-force, force))
	await  get_tree().create_timer(0.1).timeout
	$Camera2D.offset = Vector2.ZERO



func remove_engine(amount):
	engine_amount -= amount * difficulty
	pass

func remove_oxygen(amount):
	oxy_amount -= amount * difficulty
	pass

func update_ui():
	$modules/Oxygen/icon/bar/ProgressBar.value = oxy_amount
	$modules/Engine/icon/bar/ProgressBar.value = engine_amount
	




func _on_shiphull_area_entered(area):
	if area.is_in_group("Enemy"):
		area.latch()
		screen_shake(area.speed)
		hp -= area.hp
		if hp <= 0:
			get_parent().end_game(1)



func _on_flicker_1_timeout():
	flickering()
