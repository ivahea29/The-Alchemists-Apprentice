extends Node2D

signal scroll_collected


func _on_area_2d_body_entered(body):
	if body.name == "PlayerV2":
		GlobalScript.num_scrolls += 1
		emit_signal("scroll_collected")
		print_debug(GlobalScript.num_scrolls)
		queue_free()
