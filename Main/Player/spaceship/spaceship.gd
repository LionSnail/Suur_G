extends Node2D

@onready var vieport_size 

var oxy_amount = 100
var engine_amount = 100
var hp = 10
var current = ""

var difficulty = 0.1
var big_flick = false

func _ready():
	current = "Oxygen"
	print()

func _physics_process(delta):
	update_ui()
	
	difficulty += 0.0005

func flickering():
	if not big_flick:
		$lights/PointLight2D.energy = randf_range(0.00, 0.2)
	
	$lights/smalllights/smollight1.energy = randi_range(0,1)
	$lights/smalllights/smollight2.energy = randi_range(0,1)

func click(current):
	match current:
		"Oxygen":
			# play oxygen click sound
			$SoundEventManager.play_sound("oxygen")
			
			oxy_amount = clamp(oxy_amount + 3, 0, 100)
			
			
		"Engine":
			# play engine click sound
			$SoundEventManager.play_sound("engine")
			
			engine_amount = clamp(engine_amount + 3, 0, 100)
			
		
	


func set_current(type):
	current = type
	for child in get_node("modules").get_children():
		if child.name != current:
			child.active = false

func screen_shake(force):
	force = 4 * pow(force, -1) + 1
	$Camera2D.offset = Vector2(randi_range(-force, force), randi_range(-force, force))
	await  get_tree().create_timer(0.1).timeout
	$Camera2D.offset = Vector2(randi_range(-force, force), randi_range(-force, force))
	await  get_tree().create_timer(0.1).timeout
	$Camera2D.offset = Vector2(randi_range(-force, force), randi_range(-force, force))
	await  get_tree().create_timer(0.1).timeout
	$Camera2D.offset = Vector2.ZERO



func remove_engine(amount, flat_damage = false):
	if !flat_damage:
		engine_amount -= amount * difficulty
	engine_amount -= amount
	if engine_amount <= 0:
		get_parent().end_game(1)
	#add end contition

func remove_oxygen(amount):
	oxy_amount -= amount * difficulty
	if oxy_amount <= 0:
		get_parent().end_game(1)
	

func update_ui():
	$modules/Oxygen/icon/bar/ProgressBar.value = oxy_amount
	$modules/Engine/icon/bar/ProgressBar.value = engine_amount



func _on_shiphull_area_entered(area):
	if area.is_in_group("Enemy"):
		area.latch()
		
		$SoundEventManager.play_sound("hit")
		remove_engine(15, true)
		screen_shake(area.speed)
		big_flicker()
		$baseart.worry()
		
		
		hp -= area.hp
		add_cracks(hp)
		if hp <= 0:
			get_parent().end_game(1)

func add_cracks(hp):
	if hp <= 8:
		$crack_places/pos1.visible = true
	if hp <= 6:
		$crack_places/pos2.visible = true
	if hp <= 4:
		$crack_places/pos3.visible = true
	if hp <= 2:
		$crack_places/pos4.visible = true

func big_flicker():
	big_flick = true
	light_flick($lights/PointLight2D, 0.1)
	light_flick($lights/smalllights/bluelight, 1, $modules/Oxygen/icon/bar/ProgressBar)
	light_flick($lights/smalllights/redlight, 1, $modules/Engine/icon/bar/ProgressBar)
	
	big_flick = false

func light_flick(light, end_amount, bar = false):
	for i in range(randi_range(1, 3)):
		if bar:
			bar.visible = false
		
		light.energy = 0
		await get_tree().create_timer(randf_range(0.5, 2)).timeout
		
		if bar:
			bar.visible = true
		light.energy = end_amount
		await get_tree().create_timer(randf_range(0.5, 1)).timeout



func _on_flicker_1_timeout():
	flickering()
