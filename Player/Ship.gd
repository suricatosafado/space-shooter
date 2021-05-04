extends Area2D

const Laser = preload("res://Laser/Laser.tscn")
const ExplosionEffect = preload("res://Effects/ExplosionEffect.tscn")

export(int) var SPEED : int = 100

signal player_death

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		position.y -= SPEED * delta
	if Input.is_action_pressed("ui_down"):
		position.y += SPEED * delta
	if Input.is_action_just_pressed("ui_accept"):
		fire_laser()

func fire_laser() -> void:
	var laser = Laser.instance()
	var main = get_tree().current_scene
	main.add_child(laser)
	laser.global_position = global_position

func _exit_tree() -> void:
	var explosionEffect = ExplosionEffect.instance()
	var main = get_tree().current_scene
	main.call_deferred("add_child", explosionEffect)
	explosionEffect.global_position = global_position
	emit_signal("player_death")

func _on_Ship_area_entered(area : Area2D) -> void:
	area.queue_free()
	queue_free()
