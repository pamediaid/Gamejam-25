extends Sprite3D

@export var parallax_strength : float = 0.5

func _process(delta):
	global_transform.origin.x -= parallax_strength * delta

