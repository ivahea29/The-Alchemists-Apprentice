extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$gemsCollected.set_text(str(GlobalScript.num_gems))
	$enemiesKilled.set_text(str(GlobalScript.enemies_killed))
	$numDeaths.set_text(str(GlobalScript.num_deaths))


func _on_scene_change_timeout():
	SceneTransition.change_scene_to_file("res://Scenes/Menu/main_menu.tscn")
