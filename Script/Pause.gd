extends Control


@onready var menu = $Menu
@onready var options = $Options
@onready var video = $Video
@onready var audio = $Audio


func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		toggle()

func toggle():
	visible = !visible
	get_tree().paused = visible
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _on_start_pressed():
	toggle()
	get_tree().paused = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	


func _on_options_pressed():
	show_and_hide(options, menu)


func show_and_hide(first, second):
	first.show()
	second.hide()


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")


func _on_video_pressed():
	show_and_hide(video, options)


func _on_audio_pressed():
	show_and_hide(audio, options)


func _on_back_button_options_pressed():
	show_and_hide(menu, options)


func _on_fullscreen_toggled(toggled_on):
	toggled_on = DisplayServer.WINDOW_MODE_FULLSCREEN


func _on_borderless_toggled(toggled_on):
	toggled_on = DisplayServer.WINDOW_FLAG_BORDERLESS


func _on_vsync_toggled(toggled_on):
	toggled_on = DisplayServer.VSYNC_ENABLED


func _on_back_button_video_pressed():
	show_and_hide(options, video)


func _on_master_value_changed(value):
	volume(0, value)


func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, value)


func _on_music_value_changed(value):
	volume(1, value)


func _on_sound_fx_value_changed(value):
	volume(2, value)


func _on_back_button_audio_pressed():
	show_and_hide(options, audio)
