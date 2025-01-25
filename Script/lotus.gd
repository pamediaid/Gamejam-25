extends StaticBody3D

@onready var animation = $AnimationPlayer


func _on_area_3d_body_entered(body):
	if body.name == "Pler":
		animation.play("idle")
