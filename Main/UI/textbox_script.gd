extends Control

@onready var file = "res://Artwork/enviroment/story.txt"


func _ready():
	load_file(file)

func load_file(file):
	var f = FileAccess.open(file, FileAccess.READ)
	f = f.get_as_text()
	f = f.split("\n")
	for h in f:
		h = h.rstrip("\r")
		await get_tree().create_timer(4).timeout
		$VBoxContainer/CenterContainer/Label.text = h
	
	end()

func end():
	pass


