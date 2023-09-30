extends Node2D

@export var dir_x : int = 0

@onready var enemy_base = load("res://Main/Enemy/enemy.tscn")
@onready var enemy_type = {
	1 : load("res://Main/Enemy/resources/Enemy_basic.tres")
}
var is_emitting = false

func create_enemy(type):
	var enemy_i = enemy_base.instantiate()
	enemy_i.position.y = randi_range(-250, 250)
	enemy_i.position.x = self.position.x
	enemy_i.stats = type
	enemy_i.dir_x = dir_x
	get_tree().get_root().get_node("Main/Enemies").add_child(enemy_i)

func _on_timer_timeout():
	randomize()
	var randnum = randi_range(1, 1)
	var type = enemy_type[randnum]
	create_enemy(type)
