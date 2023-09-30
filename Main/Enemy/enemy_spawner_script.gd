extends Node2D

@export var dir_x : int = 0

@onready var enemy_basic = load("res://Main/Enemy/enemy.tscn")
@onready var enemy_speedy = load("res://Main/Enemy/enemy_speedy.tscn")

var is_emitting = false

func create_enemy(type):
	var enemy_i
	if type == 1:
		enemy_i = enemy_basic.instantiate()
	elif type == 2:
		enemy_i = enemy_speedy.instantiate()
		
	enemy_i.position.y = randi_range(-250, 250)
	enemy_i.position.x = self.position.x
	enemy_i.dir_x = dir_x
	get_tree().get_root().get_node("Main/Enemies").add_child(enemy_i)

func _on_timer_timeout():
	randomize()
	var randnum = randi_range(1, 2)
	create_enemy(randnum)

