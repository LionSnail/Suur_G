extends Control

@onready var file = "res://Artwork/enviroment/story.txt"
var tekst

func _ready():
	tekst = load_file(file)

func load_file(file):
	var tekst = []
	var f = FileAccess.open(file, FileAccess.READ)
	f = f.get_as_text()
	f = f.split("\n")
	for h in f:
		h = h.rstrip("\r")
		tekst.append(h)
	
	return tekst



func end():
	get_tree().get_root().get_node("Main").end_game(2)




func _on_timer_timeout():
	if !tekst.is_empty():
		$VBoxContainer/CenterContainer/Label.text = tekst.pop_front()
	else:
		end()
