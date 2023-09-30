extends Node2D


func highlight(value):
	$highlight.visible = value

func add_icon(icon):
	$highlight.texture = icon
	$top.texture = icon
	self.scale = Vector2(0.5, 0.5)
