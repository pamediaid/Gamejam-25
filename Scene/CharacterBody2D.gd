extends CharacterBody2D


# Variabel untuk mengatur kecepatan karakter
@export var speed: float = 200.0  # Kecepatan horizontal
@export var jump_force: float = 400.0  # Kekuatan lompatan
@export var gravity: float = 800.0  # Gaya gravitasi

# Variabel internal

func _physics_process(delta):
	# Menambahkan gravitasi ke karakte

	# Pergerakan horizontal
	var direction = 0.0
	if Input.is_action_pressed("ui_left"):
		direction -= 1.0
	if Input.is_action_pressed("ui_right"):
		direction += 1.0

	velocity.x = direction * speed

	# Lompatan
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = -jump_force

	# Gerakan karakter
	move_and_slide()
