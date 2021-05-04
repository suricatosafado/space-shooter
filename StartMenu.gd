extends Node

func _ready():
	Music.play()

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		var main = get_tree().current_scene
		main.get_tree().change_scene("res://World.tscn")
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
