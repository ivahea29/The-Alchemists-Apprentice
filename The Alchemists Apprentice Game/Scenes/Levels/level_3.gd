extends Node2D

func _on_scroll_scroll_collected():
	$endLevelCollision/endLevelBlock.position.y = 0
	$endLevelCollision/ProgressWizard.position.y = 0
	$endLevelCollision/progressWizardBubble.position.y = 0

func _on_change_scene_area_body_entered(body):
	if body.name == "PlayerV2":
		SceneTransition.change_scene_to_file("res://Scenes/Levels/level_4.tscn")


func _on_hut_area_body_entered(body):
	if body.name == "PlayerV2":
		$caveBlock.visible = false
		$caveOutsideDoor/PointLight2D.show()
