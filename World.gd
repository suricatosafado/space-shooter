extends Node

var score = 0 setget set_score

onready var scoreLabel : Label = $ScoreLabel

func set_score(value) -> void:
	score = value
	update_score_label()

func update_score_label():
	scoreLabel.text = "Score = " + str(score) 

func update_save_data():
	var save_data = SaveAndLoad.load_data_from_file()
	if score > save_data.highscore:
		save_data.highscore = score
		SaveAndLoad.save_data_to_file(save_data)

func _on_Ship_player_death():
	update_save_data()
	yield(get_tree().create_timer(1), "timeout")
	var main = get_tree().current_scene
	main.get_tree().change_scene("res://GameOverScreen.tscn")
