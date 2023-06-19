extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event.is_action_pressed("interact"):
		print(get_overlapping_bodies().size())
		if get_overlapping_bodies().size() > 0:
			var playerInside = get_parent().get_node("PlayerV2")
			playerInside.position = Vector2(8361, 538)
