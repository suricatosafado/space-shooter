extends Area2D

const ExplosionEffect = preload("res://Effects/ExplosionEffect.tscn")

export(int) var SPEED : int = 30
export(int) var ARMOR : int = 3

func _process(delta : float) -> void:
	position.x -= SPEED * delta

func _on_Enemy_body_entered(body : RigidBody2D) -> void:
	body.create_hit_effect()
	body.queue_free()
	ARMOR -= 1
	if ARMOR <= 0:
		add_to_score()
		create_explosion()
		queue_free()

func add_to_score() -> void:
	var main = get_tree().current_scene
	if main.is_in_group("World"):
		main.score += 10

func create_explosion() -> void:
	var explosionEffect = ExplosionEffect.instance()
	var main = get_tree().current_scene
	main.add_child(explosionEffect)
	explosionEffect.global_position = global_position

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
