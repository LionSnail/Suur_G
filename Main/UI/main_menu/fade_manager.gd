extends Node2D


var fade 
var fadeOut

func _ready():
	fade_in()

func pauser():
	get_tree().paused = true
	await get_tree().create_timer(1).timeout
	get_tree().paused = false

func fade_in():
	$AnimationPlayer.play("fade")
	pauser()

func fade_out():
	$AnimationPlayer.play("fade out")
