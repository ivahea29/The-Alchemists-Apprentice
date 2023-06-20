extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event.is_action_pressed("interact"):
		if get_overlapping_bodies().size() > 0:
			var playerInside = get_parent().get_node("PlayerV2")
			playerInside.position = Vector2(7186, 554)


func _on_body_entered(body):
	if body is CharacterBody2D:
		$insideOpenDoor.show()


func _on_body_exited(body):
	if get_overlapping_bodies().size() < 2:
		$insideOpenDoor.hide()
