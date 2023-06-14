extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("interact"):
		if get_overlapping_bodies().size() > 0:
			var playerOutside = get_parent().get_node("PlayerV2")
			playerOutside.position = Vector2(2845, 426)


func _on_body_entered(body):
	if body is CharacterBody2D:
		$insideOpenDoor.show()


func _on_body_exited(body):
	if get_overlapping_bodies().size() < 1:
		$insideOpenDoor.hide()
