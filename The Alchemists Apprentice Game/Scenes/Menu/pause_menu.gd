extends Control

@export var level_4 : GameManager

func _ready():
	hide()
	level_4.connect("toggle_game_paused", _on_level_4_toggle_game_paused)
	
func _process(delta):
	pass

func _on_level_4_toggle_game_paused(is_paused : bool):
	if(is_paused):
		show()
	else:
		hide()
