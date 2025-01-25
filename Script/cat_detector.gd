extends Cat
class_name CatDetector

@onready var cat_detector = $"."
@onready var animation = $"../Cat/AnimationPlayer"


func _ready():
	cat_watching()

func cat_watching():
	cat_start_watch()
	await get_tree().create_timer(cat_time_watch).timeout
	cat_break_watch()
	await get_tree().create_timer(cat_time_watch).timeout
	cat_watching()

func cat_start_watch():
	animation.play("open_eye")
	cat_detector.monitoring = true

func cat_break_watch():
	animation.play("close_eye")
	cat_detector.monitoring = false
	if cat_time_watch > 2:
		cat_time_watch -= 2

func _on_body_entered(body):
	if body.name == "Pler":
		body.queue_free()
