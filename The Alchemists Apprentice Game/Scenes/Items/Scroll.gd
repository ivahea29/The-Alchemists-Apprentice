extends Node2D

signal scroll_collected

func _on_area_2d_body_entered(body):
	if body.name == "PlayerV2":
		$pageFX.play()
		GlobalScript.num_scrolls += 1
		emit_signal("scroll_collected")
		print_debug(GlobalScript.num_scrolls)
		$Sprite2D.visible = false
		$Area2D.queue_free()
		$Timer.wait_time = $pageFX.stream.get_length()
		$Timer.start()
		set_process(true)


func _on_timer_timeout():
	queue_free()
