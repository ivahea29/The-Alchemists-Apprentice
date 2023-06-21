extends Control


func _on_play_pressed():
	SceneTransition.change_scene_to_file("res://Scenes/StartScenes/intro_scene.tscn")


func _on_how_to_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu/how_to_play.tscn")


func _on_controls_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu/Next_how_to_play.tscn")


func _on_about_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu/AUthors.tscn")


func _on_quit_pressed():
	get_tree().quit()
