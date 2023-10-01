extends Node2D


func _ready():
	idle()


func worry():
	$Character.play("worry")

func idle():
	$Character.play("idle")

func big_worry():
	$Character.play("bigworry")
