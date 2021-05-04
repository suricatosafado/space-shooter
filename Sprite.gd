extends Sprite

export(int) var SPEED : int = 40
export(int) var ARMOR : int = 3

func _process(delta : float) -> void:
	position.x -= SPEED
