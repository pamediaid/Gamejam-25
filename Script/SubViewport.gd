extends SubViewport

func _ready():
	var my_2d_scene = preload("res://Scene/parallax.tscn").instantiate()
	add_child(my_2d_scene)
