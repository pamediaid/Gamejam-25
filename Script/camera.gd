extends Node3D

@onready var cam = $Camera3D
@onready var ray = $RayCast3D
@onready var node_3d = $Node3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray.is_colliding():
		var collision_point = ray.get_collision_point()
		var collision_normal = ray.get_collision_normal()
		var safe_position = collision_point + collision_normal * 0.1  # Tambahkan offset kecil untuk menghindari penembusan tembok
		cam.global_transform.origin = lerp(cam.global_transform.origin, safe_position, 0.2)
	else:
		cam.global_transform.origin = lerp(cam.global_transform.origin, node_3d.global_transform.origin, 0.2)
