extends Node2D



func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		$PlayerV2.position = Vector2(3248, 576)


func _on_pausemenu_resume_game():
	pass # Replace with function body.
