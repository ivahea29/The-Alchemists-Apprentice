extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_body_entered(body):
	if body is CharacterBody2D:
		$outsideOpenDoor.show()


func _on_body_exited(body):
	if get_overlapping_bodies().size() < 2:
		$outsideOpenDoor.hide()
