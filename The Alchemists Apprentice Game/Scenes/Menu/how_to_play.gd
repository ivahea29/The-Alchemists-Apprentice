extends Control

func _on_return_to_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu/main_menu.tscn")


func _on_next_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu/Next_how_to_play.tscn")
