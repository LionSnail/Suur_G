extends Node2D

@export var fade_in_start : bool

func _ready():
	if fade_in_start:
		fade_in()

func pauser(wait_time = 1, ):
	get_tree().paused = true
	await get_tree().create_timer(wait_time).timeout
	get_tree().paused = false


func fade_in():
	$AnimationPlayer.play("fade")
	pauser()

func fade_out(time = 1):
	$AnimationPlayer.play("fade out")
	pauser(time)

func fade_in_long():
	$AnimationPlayer.play("fade in long")
	pauser()

func fade_out_long():
	$AnimationPlayer.play("fade out")
	pauser(2)
