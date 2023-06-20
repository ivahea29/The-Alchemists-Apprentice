extends Node2D



func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		if body.position.x < 3616:
			$PlayerV2.position = Vector2(3248, 576)
		else:
			$PlayerV2.position = Vector2(3923, 592)


func _on_pausemenu_resume_game():
	pass # Replace with function body.
	

#Scroll pickup handling at basic level. No hud integration etc
func _on_scroll_scroll_collected():
	$levelEndCollision/endLevelBlock.position.y = 0
	$levelEndCollision/ProgressWizard.position.y = 0
	$levelEndCollision/progressWizardBubble.position.y = 0


func _on_change_scene_area_body_entered(body):
	if body.name == "PlayerV2":
		SceneTransition.change_scene_to_file("res://Scenes/Levels/level_3.tscn")
