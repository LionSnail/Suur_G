extends Area2D

var is_mouse = false
var on_guns = false

@export var hp : int
@export var speed : float
#var latch_sprite

var dir_x = 0

func _ready():
#	latch_sprite = stats.sprite_latch
	
	$Sprite2D.play("default")
	
	if dir_x == -1:
		$Sprite2D.flip_h = false
		$CollisionPolygon2D.scale.x = -1


func die():
	queue_free()
#	$AnimationPlayer.play("death")
	await get_tree().create_timer(1).timeout
	queue_free()


func _physics_process(delta):
	move_local_x(dir_x * speed)
	
	if Input.is_action_just_pressed("click") and is_mouse:

		hp -= 1
		if hp <= 0:
			die()




func latch():
	#change sprite
	dir_x = 0

func _on_mouse_entered():
	is_mouse = true


func _on_mouse_exited():
	is_mouse = false
