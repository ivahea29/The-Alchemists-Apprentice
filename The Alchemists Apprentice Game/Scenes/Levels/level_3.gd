extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_scroll_scroll_collected():
	$scrollTimer.start()


func _on_scroll_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/Levels/level_4.tscn")
	GlobalScript.resetPlayerHealth()
