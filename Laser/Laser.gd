extends RigidBody2D

const HitEffect = preload("res://Effects/HitEffect.tscn")

onready var lasersound : AudioStreamPlayer2D = $LaserSound

func _ready():
	lasersound.play()

func create_hit_effect():
	var hitEffect = HitEffect.instance()
	var main = get_tree().current_scene
	main.add_child(hitEffect)
	hitEffect.global_position = global_position
