extends Node2D



func _on_scroll_scroll_collected():
	$scrollTimer.start()
	
func _on_scroll_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/Levels/level_2.tscn")

