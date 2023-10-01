extends Area2D

var is_mouse = false
var active = false
var type = name
@export var DEBUG_BOOST = 40
@export var icon : CompressedTexture2D 

func _ready():
	pass

func _physics_process(_delta):
	if Input.is_action_just_pressed("click") and is_mouse:
		active = true
		get_parent().get_parent().click(name)
	
	if active:
		get_parent().get_parent().set_current(name)



func _on_mouse_entered():
	is_mouse = true
	get_node("icon").highlight(true)


func _on_mouse_exited():
	is_mouse = false
	get_node("icon").highlight(false)


func _on_timer_timeout():
	if name == "Oxygen":
		get_parent().get_parent().remove_oxygen(get_tree().get_root().get_node("/root/Autoload").oxy_num)
		
	elif name == "Engine":
		get_parent().get_parent().remove_engine(get_tree().get_root().get_node("/root/Autoload").engine_num)
