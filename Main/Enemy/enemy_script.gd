extends Area2D

var is_mouse = false
var on_guns = false
@export var stats : Resource

var hp
var speed
var idle_sprite
var latch_sprite

var dir_x = 0

func _ready():
	hp = stats.hp
	speed = stats.speed
	idle_sprite = stats.sprite_idle
	latch_sprite = stats.sprite_latch
	
	if dir_x == -1:
		$Sprite2D.flip_h = false
		$CollisionPolygon2D.scale.x = -1
	


func _physics_process(delta):
	move_local_x(dir_x)
	
	if Input.is_action_just_pressed("click") and is_mouse:
		hp -= 1
		if hp <= 0:
			queue_free()


func latch():
	#change sprite
	dir_x = 0

func _on_mouse_entered():
	is_mouse = true


func _on_mouse_exited():
	is_mouse = false
