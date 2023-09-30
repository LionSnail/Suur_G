extends Node2D

@onready var vieport_size 

var oxy_amount = 100
var engine_amount = 100
var repair_amount = 100
var current = ""

func _ready():
	current = "Oxygen"

func _physics_process(delta):
	pass


func click(current):
	match current:
		"Oxygen":
			oxy_amount = clamp(oxy_amount + 1, 0, 100)
			print(oxy_amount)
		
		"Engine":
			engine_amount = clamp(engine_amount + 1, 0, 100)
			
		"Repair":
			repair_amount = clamp(repair_amount + 1, 0, 100)
			
		"Guns":
			pass
	


func set_current(type):
	current = type
	for child in get_node("modules").get_children():
		if child.name != current:
			child.active = false


func remove_oxygen(amount):
	oxy_amount -= amount
	pass

