extends Camera3D

@onready var sky = $Sky.get_children()


func _process(delta):
	for layer in sky:
		var distance_factor = layer.get("distance_factor") * 1.0
		layer.global_transform.origin.x = global_transform.origin.x * distance_factor
		layer.global_transform.origin.y = global_transform.origin.y * distance_factor
