extends Node2D

const Enemy = preload("res://Enemy/Enemy.tscn")

onready var spawnerPoints : Node2D = $SpawnerPoints

func get_spawner_position():
	var points = spawnerPoints.get_children()
	points.shuffle()
	return points[0].global_position

func spawn_enemy():
	var enemy = Enemy.instance()
	var main = get_tree().current_scene
	main.add_child(enemy)
	enemy.global_position = get_spawner_position()

func _on_Timer_timeout():
	spawn_enemy()
