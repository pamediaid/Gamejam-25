extends CanvasLayer

@onready var label = $Panel/Label  # Akses node Label
@onready var animation_player = $AnimationPlayer

# Fungsi untuk menampilkan hint
func show_hint(text: String, duration: float = 3.0):
	label.text = text
	visible = true
	animation_player.play("spawn")
	# Sembunyikan hint setelah durasi tertentu
	await get_tree().create_timer(duration).timeout
	animation_player.play("hide")
	await  get_tree().create_timer(0.7).timeout
	visible = false

# Fungsi untuk menyembunyikan hint secara manual
func hide_hint():
	visible = false


func _on_hint_area_spawn_body_entered(body):
	if body.name == "Pler":
		show_hint("Tekan tombol E untuk membuka pintu")
		$"../../HintAreaSpawn".queue_free()
