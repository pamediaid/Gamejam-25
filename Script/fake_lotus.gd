extends StaticBody3D



@onready var fake_lotus = $"."
@onready var animation = $AnimationPlayer


func disappear():
	fake_lotus.queue_free()


func _on_area_3d_body_entered(body):
	if body.name == "Pler":
		animation.play("idle")
		await get_tree().create_timer(0.7).timeout
		disappear()
