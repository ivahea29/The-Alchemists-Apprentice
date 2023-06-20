extends Node2D



func _on_scroll_scroll_collected():
	$endLevelCollision/endLevelBlock.position.y = -261
	$endLevelCollision/ProgressWizard.position.y = -261
	$SpeechBubbles/progressWizardBubble.position.y = -261

func _on_end_change_scene_body_entered(body):
	if body.name == "PlayerV2":
		SceneTransition.change_scene_to_file("res://Scenes/Levels/level_2.tscn")
