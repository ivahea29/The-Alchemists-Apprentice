extends Node2D



func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		if body.position.x < 3616:
			$PlayerV2.position = Vector2(3248, 576)
		else:
			$PlayerV2.position = Vector2(3923, 592)


func _on_pausemenu_resume_game():
	pass # Replace with function body.
