extends Control

signal resume_game

func _ready():
	hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _input(event):
	if event.is_action_pressed("pause"):
		resume()

func resume():
	emit_signal("resume_game")
	hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
