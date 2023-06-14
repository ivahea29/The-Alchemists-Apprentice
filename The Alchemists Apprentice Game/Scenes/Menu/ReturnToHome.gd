extends Button




func _on_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu/main_menu.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu/how_to_play.tscn")
