extends Node2D

signal scroll_collected

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name == "PlayerV2":
		GlobalScript.num_scrolls += 1
		emit_signal("scroll_collected")
		print_debug(GlobalScript.num_scrolls)
		queue_free()
